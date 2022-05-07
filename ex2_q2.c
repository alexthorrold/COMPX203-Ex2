#include "lib_ex2.h"

void count(int start, int end)
{
    writessd(start);

    if (start >= 0 && start < 10000 && end >= 0 && end < 10000)
    {
        if (start < end)
        {
            while (start <= end)
            {
                writessd(start);
                start++;
                delay();
            }
        }
        else if (start == end)
        {
            writessd(start);
        }
        else
        {
            while (end <= start)
            {
                writessd(start);
                start--;
                delay();
            }
        }
    }
}
