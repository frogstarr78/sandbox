#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <stdbool.h>

#define MAX_DATA 512
#define MAX_ROWS 100

struct Address {
	int id;
	int set;
	char name[MAX_DATA];
	char email[MAX_DATA];
};

struct Database {
	struct Address rows[MAX_ROWS];
};

struct Connection {
	FILE *file;
	struct Database *db;
};

void die(const char *message)
{
	if( errno ) {
		perror(message);
	} else {
		printf("Error: %s\n", message);
	}
	exit(1);
}

void Address_print(struct Address *addr)
{
	printf("%d %s %s\n", addr->id, addr->name, addr->email);
}

void Database_load(struct Connection *conn)
{
	int rc = fread(conn->db, sizeof(struct Database), 1, conn->file);
	if( rc != 1 ) die("Failed to load database.");
}

struct Connection *Database_open(const char *filename, char mode)
{
	struct Connection *conn = malloc(sizeof(struct Connection));
	if( !conn ) die("Memory error!");

	conn->db = malloc(sizeof(struct Database));
	if( !conn->db ) die("Memory error!");

	if ( mode == 'c' ) {
		conn->file = fopen(filename, "w");
	} else {
		conn->file = fopen(filename, "r+");

		if( conn->file ) {
			Database_load(conn);
		}
	}

	if( !conn->file ) die("Failed to open file.");

	return conn;
}

void Database_close(struct Connection *conn)
{
	if(conn) {
		if(conn->file) fclose(conn->file);
		if(conn->db) free(conn->db);
		free(conn);
	}
}

void Database_write(struct Connection *conn)
{
	rewind(conn->file);

	int rc = fwrite(conn->db, sizeof(struct Database), 1, conn->file);
	if(rc != 1) die("Failed to write database");

	rc = fflush(conn->file);
	if( rc == -1 ) die("Cannot flush database");
}

void Database_create(struct Connection *conn)
{
	int i;

	for(i=0; i < MAX_ROWS; i++) {
		// make a prototype to initialize at
		struct Address addr = {.id = i, .set = 0};
		// then just assign it
		conn->db->rows[i] = addr;
	}
}

int Database_nrows( struct Connection *conn )
{
	int r = 0;
	int i;
	struct Database *db = conn->db;
	for(i=0; i < MAX_ROWS; i++) {
		struct Address *cur = &db->rows[i];
		if(cur->set) {
			r++;
		}
	}
	return r;
}

void Database_set(struct Connection *conn, int id, const char *name, const char *email)
{
	struct Address *addr = &conn->db->rows[id];
	if(addr->set) die("Already set, delete it first.");

	addr->set = 1;
	// WARNING; bug, read the "How to Break it" and fix this.
	char *res = strncpy(addr->name, name, MAX_DATA);
	if(!res) die("Name copy failed.");

	res = strncpy(addr->email, email, MAX_DATA);
	if(!res) die("Email copy failed.");
}

void Database_add(struct Connection *conn, const char *name, const char *email)
{
	int id = Database_nrows(conn)+1;
	printf("%d\n", id);
	Database_set(conn, id, name, email);
}

void Database_update(struct Connection *conn, int id, const char *name, const char *email)
{
	struct Address *addr = &conn->db->rows[id];
	if(!addr->set) die("Isn't set, set it first.");

	addr->set = 1;
	char *res = strncpy(addr->name, name, MAX_DATA);
	if(!res) die("Name copy failed.");

	res = strncpy(addr->email, email, MAX_DATA);
	if(!res) die("Email copy failed.");
}

void Database_get(struct Connection *conn, int id)
{
	struct Address *addr = &conn->db->rows[id];

	if(addr->set) {
		Address_print(addr);
	} else {
		die("ID is not set");
	}
}

void Database_find_name(struct Connection *conn, const char *name)
{
	bool found = false;
	int i;
	struct Address *addr;
	char fname[MAX_DATA];
	char *res = strncpy(fname, name, MAX_DATA);
	if(!res) die("Name copy failed.");

	for(i=0; i < MAX_ROWS; i++) {
		addr = &conn->db->rows[i];

		if(strncmp(addr->name, fname, MAX_DATA) == 0) {
			Address_print(addr);
			found = true;
		}
	}

	if(!found) printf("Unable to find record with name %s\n", name);
}

void Database_delete(struct Connection *conn, int id)
{
	struct Address addr = {.id = id, .set = 0};
	conn->db->rows[id] = addr;
}

void Database_list(struct Connection *conn)
{

	int i;
	struct Database *db = conn->db;

	for(i=0; i < MAX_ROWS; i++) {
		struct Address *cur = &db->rows[i];

		if(cur->set) {
			Address_print(cur);
		}
	
	}
}

int main(int argc, char *argv[])
{
	if(argc < 3) die("Usage: ex17 <dbfile> <action> [action params]");

		char *filename = argv[1];
		char action = argv[2][0];
		struct Connection *conn;
		int id;


		switch(action) {
			case 'c':
				conn = Database_open(filename, action);
				Database_create(conn);
				Database_write(conn);
				break;

			case 'f':
				if(argc != 4) die("Need a name to find");

				conn = Database_open(filename, action);
				Database_find_name(conn, argv[3]);
				Database_close(conn);
				break;

			case 'g':
				if(argc > 3)  id = atoi(argv[3]);
				if(id >= MAX_ROWS) die("The are already too many records.");
				if(argc != 4) die("Need an ID to get");

				conn = Database_open(filename, action);
				Database_get(conn, id);
				Database_close(conn);
				break;

			case 'a':
				if(argc > 3)  id = atoi(argv[3]);
				//if(argc != 5) die("Need name, and email to set.");

				conn = Database_open(filename, action);
				Database_add(conn, argv[4], argv[5]);
				Database_write(conn);
				Database_close(conn);
				break;

			case 's':
				if(argc > 3)  id = atoi(argv[3]);
				if(id >= MAX_ROWS) die("The are already too many records.");
				if(argc != 6) die("Need id, name, and email to set.");

				conn = Database_open(filename, action);
				Database_set(conn, id, argv[4], argv[5]);
				Database_write(conn);
				Database_close(conn);
				break;

			case 'd':
				if(argc > 3)  id = atoi(argv[3]);
				if(id >= MAX_ROWS) die("The are already too many records.");
				if(argc != 4) die("Need an ID to delete");

				conn = Database_open(filename, action);
				Database_delete(conn, id);
				Database_write(conn);
				Database_close(conn);
				break;

			case 'l':
				conn = Database_open(filename, action);
				Database_list(conn);
				Database_close(conn);
				break;

			case 'u':
				if(argc > 3)  id = atoi(argv[3]);
				if(id >= MAX_ROWS) die("The are already too many records.");
				if(argc != 6) die("Need id, name, and email to set.");

				conn = Database_open(filename, action);
				Database_update(conn, id, argv[4], argv[5]);
				Database_write(conn);
				Database_close(conn);
				break;

			case 'z':
				conn = Database_open(filename, action);
				printf("%d\n", Database_nrows(conn));
				Database_close(conn);
				break;

			default:
				die("Invalid action, only: c=create, a=add, g=get, f=find, s=set, d=delete, l=list, u=update, z=size");
				break;
		}

		return 0;
}
