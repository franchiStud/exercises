#include <iostream>
#include <string>
#include <cstring>

using namespace std;

class Date{
    private:
        int day;
        int month;
        int year;

        void assignValue(int* p, string s, int* i){
            *p=0;
            int d=1;
            while(s.at(*i)!='-'){
                *p+=d*(s.at(*i)-48);

                *i-=1;
                d*=10;

                if(*i<0) break;
            }
            *i-=1;
        }
    public:
        Date() {
            day=1;
            month=1;
            year= 1970;
        }
        int getDay()   { return day; }
        int getMonth() { return month; }
        int getYear()  { return year; }

        void addDays(int days=1)  {
            while(days-->0){
                if((this->month==1 ||
                        this->month==3 ||
                        this->month==5 ||
                        this->month==7 ||
                        this->month==8 ||
                        this->month==10 ||
                        this->month==12)
                        && this->day==31) {
                     day=1;
                     if(++this->month>12){
                         this->month=1;
                         this->year++;
                     }

                }
                else if((this->month==4 ||
                         this->month==6 ||
                         this->month==9 ||
                         this->month==11)
                        &&this->day==30) {
                    day=1;
                    if(++this->month>12){
                        this->month=1;
                        this->year++;
                    }
                }
                else if((this->month==2)
                        &&(this->year%4==0 &&
                           this->year%100!=0)
                        &&this->day==29){
                    day=1;
                    if(++this->month>12){
                        this->month=1;
                        this->year++;
                    }
                }
                else if(this->day==28){
                    day=1;
                    if(++this->month>12){
                        this->month=1;
                        this->year++;
                    }
                }
                else
                    day++;
            }
        }
        void addMonths(int months=1) {

            while(months-->0){
                if(this->month==1 ||
                        this->month==3 ||
                        this->month==5 ||
                        this->month==7 ||
                        this->month==8 ||
                        this->month==10 ||
                        this->month==12)
                    addDays(31);
                else if(this->month==4 ||
                        this->month==6 ||
                        this->month==9 ||
                        this->month==11)
                    addDays(30);
                else if((this->month==2)
                        &&(this->year%4==0 &&
                           this->year%100!=0))
                    addDays(29);
                else
                    addDays(28);
            }

        }
        void addYears(int years=1) {
            addMonths(12*years);
        }

        void parseDate(string string){
            int i=string.size()-1;
            assignValue(&year, string, &i);
            assignValue(&month, string, &i);
            assignValue(&day, string, &i);
        }

        char* toString(const Date &date){
            string a = "Date("+to_string(day)+","+
                to_string(month)+","+to_string(year)+")";
            char c[a.length()];
            strcpy(c,a.c_str());
            return c;
        }

        friend ostream& operator<<(ostream &out, const Date &data){
            out << data.day << "-" << data.month << "-" << data.year;
            return out;
        }
        friend bool operator==(const Date &first, const Date &second){
            return first.day  ==second.day
                 &&first.month==second.month
                 &&first.year ==second.year;
        }

};
int main(){
    Date d1;
    d1.parseDate("12-3-2034");
    d1.addMonths();
    cout << d1 << endl;
}
