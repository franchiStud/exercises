#include <vector>

#include "filter.cpp"

using namespace std;

class PhoneBook {
    private:
        vector<Contact> contacts;
    public:
        PhoneBook();
        void append(Contact c);

        Contact* find(string n);

        vector<Contact> filterContacts(filter *f);

        friend ostream& operator<<(ostream &out, const PhoneBook &p);
};
