(module
 (type $i (func (result i32)))
 (type $iii (func (param i32 i32) (result i32)))
 (type $III (func (param i64 i64) (result i64)))
 (type $FFF (func (param f64 f64) (result f64)))
 (type $v (func))
 (global $function-types/i32Adder (mut i32) (i32.const 0))
 (global $function-types/i64Adder (mut i32) (i32.const 0))
 (global $HEAP_BASE i32 (i32.const 4))
 (table 3 3 anyfunc)
 (elem (i32.const 0) $function-types/makeAdder<i32>~anonymous|0 $function-types/makeAdder<i64>~anonymous|1 $function-types/makeAdder<f64>~anonymous|2)
 (memory $0 1)
 (export "memory" (memory $0))
 (start $start)
 (func $function-types/makeAdder<i32>~anonymous|0 (; 0 ;) (type $iii) (param $0 i32) (param $1 i32) (result i32)
  (return
   (i32.add
    (get_local $0)
    (get_local $1)
   )
  )
 )
 (func $function-types/makeAdder<i32> (; 1 ;) (type $i) (result i32)
  (return
   (i32.const 0)
  )
 )
 (func $function-types/makeAdder<i64>~anonymous|1 (; 2 ;) (type $III) (param $0 i64) (param $1 i64) (result i64)
  (return
   (i64.add
    (get_local $0)
    (get_local $1)
   )
  )
 )
 (func $function-types/makeAdder<i64> (; 3 ;) (type $i) (result i32)
  (return
   (i32.const 1)
  )
 )
 (func $function-types/makeAdder<f64>~anonymous|2 (; 4 ;) (type $FFF) (param $0 f64) (param $1 f64) (result f64)
  (return
   (f64.add
    (get_local $0)
    (get_local $1)
   )
  )
 )
 (func $function-types/makeAdder<f64> (; 5 ;) (type $i) (result i32)
  (return
   (i32.const 2)
  )
 )
 (func $start (; 6 ;) (type $v)
  (nop)
  (set_global $function-types/i32Adder
   (call $function-types/makeAdder<i32>)
  )
  (drop
   (call_indirect (type $iii)
    (i32.const 1)
    (i32.const 2)
    (get_global $function-types/i32Adder)
   )
  )
  (set_global $function-types/i64Adder
   (call $function-types/makeAdder<i64>)
  )
  (drop
   (call_indirect (type $III)
    (i64.const 1)
    (i64.const 2)
    (get_global $function-types/i64Adder)
   )
  )
  (drop
   (call $function-types/makeAdder<f64>)
  )
  (block
   (drop
    (i32.const 1)
   )
   (drop
    (i32.const 2)
   )
  )
 )
)
