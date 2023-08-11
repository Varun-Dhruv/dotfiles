local luasnip_status_ok, ls = pcall(require, 'luasnip')
if not luasnip_status_ok then
  return
end
local snip=ls.snippet
local text=ls.text_node
local node=ls.snippet_node

-- custom snippets
return snip({
      trig="include<cp>",
      namr="CP-Cpp snippet",
      dscr="Snippet for competitive programming in c++"
    },{
      text({
        "#include<bits/stdc++.h>",
        "#define ll long long",
        --`#define endl '\n'`,
        "#define vi vector<int>",
        "#define fi first",
        "#define se second",
        "#define pq priority_queue",
        "#define vll vector<long long>",
        "#define pb push_back",
        "#define rep(i, a, b) for (int i = a; i < b; i++)",
        "using namespace std;",
        "int main() {",
        "   ios_base::sync_with_stdio(false);",
        "   cin.tie(NULL);",
        "   ll t;",
        "   cin >> t;",
        "   while (t--) {",
        "   }",
        "   return 0;",
        "}",
    })
    })
