#include "filter.h"

filter::filter(){}

bool filter::check(Contact c) { return true; }

void filter::initialize(std::vector<Contact> c) { basevector=c; }
