/* 
 * Copyright 2010 Frogstarr78 Software
 * My long lost hash class written in ~2005 
 * (hence the ugliness).
 *
 * I keep it around because of the nifty feature that
 * I implemented in it. Hash with regex keys. Only
 * the regex is a regex lookup on the keys stored in the hash
 * rather than objects, like in ruby, who's reference would be the
 * key. I thought it was ingenious at the time and still
 * think it is a pretty useful feature despite my turning away
 * from "everything can be solved with a regex" phase.
 *
 * In case you were wondering also, the methods were taken from
 * Perl. I was big into it at the time too. I still like the methods
 * even if I don't like perl as much.
 *
 */
function Hash(){

this.keys       = _hash_keys
this.values  	= _hash_values
this.exists  	= _hash_exists
this.defined 	= _hash_defined
this.each    	= _hash_each
this.find	    = _hash_find
this.del        = _hash_del
this.localProperties = new Array('keys', 'values', 'exists', 'defined', 'valueOf', 'each', 'find', 'objectType', 'del', 'localProperties')

if(typeof a == 'object'){
      for(I in a){ this[I] = a[I]; }
} else {
    for(I=0; I < arguments.length; I++){
	    this[arguments[I]] = arguments[++I];
    }
}
return this;
}

function _hash_del(hash_del_key){ hash_del(this, hash_del_key); }
function hash_del(hash_del_obj, hash_del_key){ delete hash_del_obj[hash_del_key]; }

function _hash_find(hash_find_what){ return hash_find(this, hash_find_what); }
function hash_find(hash_find_obj, hash_find_what){
  var _found_ = new Array()
  
  hfMf:for(hfM in hash_find_obj){

	for(AI=0; AI< hash_find_obj.localProperties.length; AI++){ 
	   if(hash_find_obj.localProperties[AI] == hfM){  continue hfMf; } 
	}
     	if(hfM == '_each_') continue hfMf;
  
     switch(typeof hash_find_what){
        case 'object':   if(hfM.match(hash_find_what)){ _found_.push(hash_find_obj[hfM]); } break;
        case 'function': if(hfM.match(hash_find_what)){ _found_.push(hash_find_obj[hfM]); } break;
	case 'string':   if(hfM == hash_find_what){ _found_.push(hash_find_obj[hfM]); } break;
	 } 
  }

  return _found_;
}
function _hash_keys(hash_keys_what){ return hash_keys(this, hash_keys_what); }
function hash_keys(hash_keys_obj, hash_keys_what){
var _keys_ = new Array()
  
  hkMf:for(hkM in hash_keys_obj){

	for(AI=0; AI< hash_keys_obj.localProperties.length; AI++){ 
	   if(hash_keys_obj.localProperties[AI] == hkM){  continue hkMf; } 
	}
     	if(hkM == '_each_') continue hkMf;
	  
      switch(typeof hash_keys_what){
	   case 'object':   if(hkM.match(hash_keys_what)){ _keys_.push(hkM); } break;
	   case 'function': if(hkM.match(hash_keys_what)){ _keys_.push(hkM); } break;
	   default: _keys_.push(hkM); break;
	   }
  }
  return _keys_;
}

function _hash_values(hash_values_what){ return hash_values(this, hash_values_what); }
function hash_values(hash_values_obj, hash_values_what){
var _values_ = new Array()
  
  hvMf:for(hvM in hash_values_obj){ 

	for(AI=0; AI< hash_values_obj.localProperties.length; AI++){ 
	   if(hash_values_obj.localProperties[AI] == hvM){  continue hvMf; } 
	}
     	if(hvM == '_each_') continue hvMf;
      
	  switch(typeof hash_values_what){
	   case 'object':   if(hash_values_obj[hvM].match(hash_values_what)){ _values_.push(hash_values_obj[hvM]); } break;
	   case 'function': if(hash_values_obj[hvM].match(hash_values_what)){ _values_.push(hash_values_obj[hvM]); } break;
	   default: _values_.push(hash_values_obj[hvM]); break;
	  }
  }
  return _values_;
}
function _hash_defined(hash_defined_what){ return hash_defined(this, hash_defined_what); }
function hash_defined(hash_defined_obj, hash_defined_what){ return hash_defined_obj[hash_defined_what] != null; }

function _hash_exists(hash_exists_what){ return hash_exists(this, hash_exists_what); }
function hash_exists(hash_exists_obj, hash_exists_what){

   for(exM in hash_exists_obj){
       //not to be confused w/ h_obj[exM] != null
	   //which would indicate a 'defined' state
       switch(typeof hash_exists_what){
	      case 'object':   if(exM.match(hash_exists_what)){ return true; } break;
	      case 'function': if(exM.match(hash_exists_what)){ return true; } break;
	      case 'string':   if(exM == hash_exists_what){ return true; } break;
	   }
   }
return false;
}

function _hash_each(hash_each_what, hash_each_orlikeperl){ return hash_each(this, hash_each_what) }
function hash_each(hash_each_obj, hash_each_what){

	if(!hash_each_obj._each_){ hash_each_obj._each_ = new Hash(); }
	_each_ = hash_each_obj._each_; 

	var eaM;
	eaMf:for(eaM in hash_each_obj){
		for(AI=0; AI< hash_each_obj.localProperties.length; AI++){ 
			if(hash_each_obj.localProperties[AI] == eaM){  continue eaMf; } 
		}
		if(eaM == '_each_') continue eaMf;

		if(!_each_.exists(eaM)){
			switch(typeof hash_each_what){
				case 'object':   
					if(eaM.match(hash_each_what)){ _each_[eaM] = hash_each_obj[eaM]; return new Array(eaM, hash_each_obj[eaM]); } break;
				case 'function': 
					if(eaM.match(hash_each_what)){ _each_[eaM] = hash_each_obj[eaM]; return new Array(eaM, hash_each_obj[eaM]); } break;
				case 'string':   
					if(eaM == hash_each_what){ _each_[eaM] = hash_each_obj[eaM]; return new Array(eaM, hash_each_obj[eaM]); } break;
				default: 
					_each_[eaM] = hash_each_obj[eaM]; 
					return new Array(eaM, hash_each_obj[eaM]);
					break;
			}
		}
	}
   
	if(_each_.exists(eaM) || eaM == '_each_'){ 
		hash_each_obj._each_ = new Hash();
		//re-init _each_ for future calls 
		return false;
	}
}
