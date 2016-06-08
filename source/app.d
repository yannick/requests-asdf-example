import std.stdio;
import std.algorithm;
import std.range;
import requests;
import asdf;
import std.conv;
import std.string;

////version 2
//struct Result
//{
//	ulong total_count;
//	bool incomplete_results;
//	Item[] items;
//}

struct Item
{
	string name;
	string description;
	string html_url;
}

void main()
{
	//last recently updated D projects on github
	string endpoint = "https://api.github.com/search/repositories?order=desc&sort=updated&q=language:D";
	

	auto items = getContent(endpoint).to!string.parseJson["items"].deserialize!(Item[]);
	
	items.each!(i => writefln("%s\t%s\t%s", i.name, i.description, i.html_url) );

	////version 2
	//auto r = new Request();
	//auto result = r.get(endpoint).responseBody.data!string.deserialize!Result;
	//foreach(i; result.items)
	//{
	//	writefln("%s\t%s\t%s", i.name, i.description, i.html_url);
	//}

}
