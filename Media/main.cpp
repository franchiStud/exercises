#include <iostream>

using namespace std;

int main()
{
    int n, i, s=0;
    cout << "Quanti valori vuoi inserire?" << endl;
    cin >> n;
    i=n;

    cout << "Inserisci i valori" << endl;
    while(i-->0) {
        int x;
        cin >> x;
        s+=x;
    }

    cout << "La somma dei valori è " << s   << endl
         << "La media dei valori è " << s/n << endl;
}
