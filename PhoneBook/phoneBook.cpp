#include <iostream>
#include "phoneBook.h"

using namespace std;

vector<Contact> contacts;

PhoneBook::PhoneBook() {}

void PhoneBook::append(Contact c) {
            contacts.push_back(c);
        }

Contact* PhoneBook:: find(string n){
            for(int i=0;i<contacts.size();i++){
                if(contacts.at(i).name==n) return &contacts.at(i);
            }
            return NULL;
        }

vector<Contact> PhoneBook::filterContacts(filter *f){
            vector<Contact> app;
            f->initialize(contacts);
            for(int i=0;i<contacts.size();i++){
                if(f->check(contacts.at(i)))
                    app.push_back(contacts.at(i));
            }
            return app;
        }

ostream& operator<<(ostream &out, const PhoneBook &p){
            for(int i=0;i<p.contacts.size();i++)
                out << p.contacts.at(i).name << " " << p.contacts.at(i).surname
                    << ": " << p.contacts.at(i).number << endl;
            return out;
        }
