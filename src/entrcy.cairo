@external
func withdrawAll{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr
}():
    alloc_locals
    let (caller) = get_caller_address()
    let (bal) = balance.read(caller)
    assert_not_zero(bal)
    let (token) = token.read()    
    IERC777.transfer(token, caller, bal)
    
    balance.write(caller, 0)
    return ()
end