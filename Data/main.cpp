#include <iostream>
#include <string>
#include <charconv>

using namespace std;

class Date{
    private:
        int day;
        int month;
        int year;
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
                     addMonths();
                }
                else if((this->month==4 ||
                         this->month==6 ||
                         this->month==9 ||
                         this->month==11)
                        &&this->day==30) {
                    day=1;
                    addMonths();
                }
                else if((this->month==2)
                        &&(this->year%4==0 &&
                           this->year%100!=0)
                        &&this->day==29){
                    day=1;
                    addMonths();
                }
                else if((this->month==2)
                        &&(this->year%4!=0 ||
                           this->year%100==0)
                        &&this->day==28){
                    day=1;
                    addMonths();
                }
                else
                    day++;
            }
        }
        void addMonths(int months=1) {
            while(months-->0){
                if(this->month==12){
                    month=1;
                    addYears();
                }
                else
                    month++;
            }
        }
        void addYears(int years=1) {
            this->year+=years;
            day--;
            addDays();
        }

        void parseDate(char* string){

        }

        char* toString() {
            char* a=0;
            return a;
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

int main()
{
    Date d1, d2;
    d2.addYears(10);
    d2.addMonths(1);
    d2.addDays(28);
    cout << d2 << endl;
}
