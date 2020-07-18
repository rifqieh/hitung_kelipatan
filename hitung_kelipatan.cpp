#include<bits/stdc++.h>
using namespace std;

int main(){
	
	int n = 0;
	int sum = 0;
	
	cout<<"Masukkan batas: ";
	cin>>n;
	
	for(int i = 1 ; i < n ; i++){
		if(i % 3 == 0 || i % 5 == 0){
			sum += i;
		}
	}
	
	cout<<"sum: "<<sum<<endl;
}
