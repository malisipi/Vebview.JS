# vebview.fs:

## .read_file(file) bool|string

If fails, return false; else, return content of file

## .write_file(file, data?) bool

If fails, return false; else, return true

## .append_file(file, data?) bool

If fails, return false; else, return true

## .remove_file(file) bool

If fails, return false; else, return true

## .move_file(file_a, file_b) bool

If fails, return false; else, return true

## .copy_file(file_a, file_b) bool

If fails, return false; else, return true

## .read_dir(dir) [string]
        
If fails, return false; else, returns array
        
## .create_dir(dir) bool

If fails, return false; else, return true

## .remove_dir(dir)=>{

If fails, return false; else, return true

## .get_stats(file_or_directory_path) object

* object
   * exists: bool
   * file_last_mod_unix: int
   * is_dir_empty: bool
   * is_directory: bool
   * is_executable: bool
   * is_file: bool
   * is_link: bool
   * is_readable: bool
   * is_writable: bool
   * size: int (as bytes)
