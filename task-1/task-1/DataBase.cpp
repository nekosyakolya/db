#include "stdafx.h"
#include "DataBase.h"


CDataBase::CDataBase()
{
}

void CDataBase::Fill(std::ifstream & input)
{
	std::string value;
	std::vector<std::string> splited;
	getline(input, value);

	size_t numId = 0;
	size_t numName = 0;

	split(splited, value, boost::is_any_of(","));
	for (size_t i = 0; i < splited.size(); ++i)
	{
		if (splited[i] == "id")
		{
			numId = i;
		}
		if (splited[i] == "author")
		{
			numName = i;
		}
	}

	while (getline(input, value))
	{
		split(splited, value, boost::is_any_of(","));

		if (splited[numName].find("\"") != std::string::npos)
		{
			splited[numName].erase(splited[numName].begin());
			splited[numName].erase(splited[numName].end() - 1);
		}

		if (m_database.find(splited[numName]) != m_database.end())
		{
			m_database.find(splited[numName])->second.push_back(splited[numId]);
		}
		else
		{
			std::vector<std::string> id;
			id.push_back(splited[numId]);
			m_database.emplace(splited[numName], id);
		}

	}
}

bool CDataBase::IsFind(std::string author) const
{
	return m_database.find(author) != m_database.end();
}

std::vector<std::string> CDataBase::GetId(std::string author) const
{
	return m_database.find(author)->second;
}


CDataBase::~CDataBase()
{
}
