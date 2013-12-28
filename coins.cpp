#include <iostream>

using namespace std;

int main(long number){
	cin>>number;
	int count25=0,count10=0,count5=0;
	while ( number > 5)
	{
		if (number > 25)
		{number-=25;count25+=1;}
		else if (number > 10)
		{number-=10;count10+=1;}
		else if (number > 5)
		{number-=5;count5+=1;}
	}
	std::cout<<"We need\n"<<count25<<" of 25's\n"<<count10<<" of 10's\n"<<count5<<" of 5's"<<endl;
	std::cout<<number<<"left"<<endl;
	return 0;
}
