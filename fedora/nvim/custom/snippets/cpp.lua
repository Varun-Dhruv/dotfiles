local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
return {
	s(
		"include<cp>",
		t({
			"#include<bits/stdc++.h>",
			"#define ll long long",
			-- '#define endl "\n"',
			"#define vi vector<int>",
			"#define fi first",
			"#define se second",
			"#define pq priority_queue",
			"#define vll vector<long long>",
			"#define pb push_back",
			"#define rep(i, a, b) for (int i = a; i < b; i++)",
			"using namespace std;",
			"int main() {",
			"#ifndef ONLINE_JUDGE",
			'   freopen("input.txt", "r", stdin);',
			'   freopen("output.txt", "w", stdout);',
			"#endif",
			"   ios_base::sync_with_stdio(false);",
			"   cin.tie(NULL);",
			"   ll t;",
			"   cin >> t;",
			"   while (t--) {",
			"   }",
			"   return 0;",
			"}",
		})
	),
}
