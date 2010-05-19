%%{

	machine HelloMachine;

  action initialize {
  
  }

  action say_hello { 

  }

	action write_message {
	
	}

	action change_message {
	
	}

  action write_error {
  
  }

	Hello = (
	 start: ( 
	   say_hello @write_message -> start |
	   set_message_string @change_message -> start |
	   set_message_nil @write_error -> no_message 
	 ),

	 no_message: ( 
	   set_message_string @change_message -> start |
	   set_message_nil -> no_message |
	   say_hello @write_error -> no_message
	 )
	) >initialize;

}%%

%% write data;
%% write init;
