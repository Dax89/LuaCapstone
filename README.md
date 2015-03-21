Lua Capstone
========

Capstone Binding for Lua<br>
All 8 architectures are supported, take a look in "tests" folder

Usage
-----

```
void runTest(lua_State* l, const char* filename)
{
    cout << "- Running: " << filename << endl;

    int err = luaL_dofile(l, filename);

    if(err)
        cout << "ERR: " << lua_tostring(l, -1) << endl;
}

int main()
{
    lua_State* l = luaL_newstate();
    luaL_openlibs(l);
    luaopen_capstone(l);

    runTest(l, "tests/test_x86.lua");
    runTest(l, "tests/test_mips.lua");
    runTest(l, "tests/test_iter.lua");

    lua_close(l);
    return 0;
}
``` 
