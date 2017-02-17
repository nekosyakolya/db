#pragma once

#include <fstream>
#include <map>
#include <vector>
#include <boost/algorithm/string.hpp>
using namespace boost;

class CDataBase
{
public:
	CDataBase();
	void Fill(std::ifstream &);
	bool IsFind(std::string) const;
	std::vector<std::string> GetId(std::string) const;
	~CDataBase();
private:
	std::map <std::string, std::vector<std::string>> m_database;
};

