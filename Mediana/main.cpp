#include <iostream>
#include <vector>
#include <iterator>

using namespace std;

vector<int> sort(vector<int> v){
    vector<int> app;

    while(v.size()>0){
        int p=0;

        for(int i=1;i<v.size();i++)
            if(v.at(i)<v.at(p)){
                p=i;
            }

        app.push_back(v.at(p));
        v.erase(v.begin()+p);
    }

    return app;
}

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

    v=sort(v);

    if(v.size()%2==0)
        m=(v.at(v.size()/2)+v.at(v.size()/2-1))/2;
    else
        m=v.at(v.size()/2);

    cout << "La mediana è " << m << endl;
}
