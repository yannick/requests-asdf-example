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

	string endpoint = "https://api.github.com/search/repositories?order=desc&sort=updated&q=language:D";
	
	auto rq = Request();
    rq.useStreaming = true;
    rq.verbosity = 2;
    auto rs = rq.get(endpoint);
    auto stream = rs.receiveAsRange();

	auto items = stream.parseJson["items"].deserialize!(Item[]);
	
	items.each!(i => writefln("%s\t%s\t%s", i.name, i.description, i.html_url) );

}
