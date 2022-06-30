#include <iostream>
#include <bits/stdc++.h>
#include <vector>

using namespace std;

int main(){
    int n, m;
    vector<int> v;

    cout << "Quanti valori vuoi inserire?" << endl;
    cin >> n;

    cout << "Inserisci i valori" << endl;
    while(n-->0) {
        int x;
        cin >> x;
        v.push_back(x);
    }

    sort(v.begin(), v.end());

    if(v.size()%2==0)
        m=(v.at(v.size()/2)+v.at(v.size()/2-1))/2;
    else
        m=v.at(v.size()/2);

    cout << "La mediana è " << m << endl;
}
