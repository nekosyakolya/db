
#include "stdafx.h"
#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
#include <iterator>

#include "DataBase.h"


int main()
{
	std::ifstream input("db.csv");

	CDataBase database;
	database.Fill(input);
	std::string username;
	std::cout << "Enter author: ";
	while (std::getline(std::cin, username))
	{
		if (!database.IsFind(username))
		{
			std::cout << "Not found";
		}
		else
		{
			std::vector<std::string> id = database.GetId(username);
			std::cout << "Record id: ";
			std::copy(id.begin(), id.end(), std::ostream_iterator<std::string>(std::cout, " "));
		}
		std::cout << "\nEnter author: ";
	}

	return EXIT_SUCCESS;
}

