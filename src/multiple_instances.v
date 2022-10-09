module main

import os
import os.filelock

fn multiple_instances(){
	lock_file_path:=os.temp_dir()+"/"+app_config.id+".lock"
	
	if !os.exists(lock_file_path){
		os.write_file(lock_file_path,"")or{}
	}
	
	mut lock_file := filelock.new(lock_file_path)
	
	if !lock_file.try_acquire() {
		println("[INFO]: Disabled Multiple Instances")
		exit(1)
	}
}