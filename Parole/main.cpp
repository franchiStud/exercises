#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <unordered_map>

using namespace std;

int main()
{
    ifstream file; string line;vector<string> vec;
    unordered_map<string, int> count; unordered_map<string, int> top;

    file.open("/home/alter02/exercises/Parole/canto1.txt");

    while(getline(file,line)) {
        int i=0;

        while(line.size()>i){
            string app="";


            while(line.at(i)!=' '&&line.at(i)!=','&&line.at(i)!='.'
                                 &&line.at(i)!='\''&&line.at(i)!=':'
                                 &&line.at(i)!=';'&&line.at(i)!='"'
                                 &&line.at(i)!='!'&&line.at(i)!='?'){
                app+=line.at(i++);
                if(line.size()<=i) break;
            }
            if(app.size()>3)
                vec.push_back(app);
            i++;
            if(line.size()<=i) break;
        }
    }

    for(int i=0;i<vec.size();i++) {
        vector<int> el; string check=vec.at(i); int tot=0;

        for(int j=0;j<vec.size();j++) {
            if(vec.at(j)==check)
                el.push_back(j);
        }
        while(el.size()>0){
            vec.erase(vec.begin()+el.at(el.size()-1));
            el.pop_back();
            tot++;
        }
        count.insert({check, tot});
        if(vec.size()<1) break;
        if(vec.size()<=i) i=0;
    }

    for(int k=0;k<5;k++){
        int n=0; string w;

        for(auto x:count){
            if(x.second>n){
                n=x.second;
                w=x.first;
            }
        }
        count.erase({w});
        cout << w << " " << n << endl;
    }

    file.close();
}
