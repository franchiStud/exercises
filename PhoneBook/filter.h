#include <string>
#include <vector>
#include "contact.cpp"

class filter {
    public:
        std::vector<Contact> basevector;

        filter();
        virtual bool check(Contact c);
        void initialize(std::vector<Contact> c);
};

