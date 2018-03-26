#include <cstdio>
#include <unordered_map>
#include <map>

typedef long long point;

#define MAX_INT 0x7FFFFFFF

#define first(x) (((x) >> 32) & MAX_INT)
#define second(x) ((x)&MAX_INT)
#define make_point(x, pos) ((point)(x) << 32 | (pos))

using namespace std;

int main()
{
    int n, m, k;
    scanf("%d %d %d", &n, &m, &k);

    unordered_map<point, point> dic;
    map<point, int> top;
    point *from = (point *)malloc(sizeof(point) * k);
    point to[k];
    point kids[k];

    int a1, b1, a2, b2;
    for (int i = 0; i < k; i++)
    {
        scanf("%d %d %d %d", &a1, &b1, &a2, &b2);

        point v;
        v = make_point(a1, b1);

        from[i] = v;
        to[i] = make_point(a2, b2);

        ++dic[v];
        top[v] = 0;
    }

    int pos = 0;
    for (auto &elem : dic)
    {
        int tmp = elem.second;
        elem.second |= ((point)pos) << 32;
        pos += tmp;
    }

    for (int i = 0; i < k; i++)
    {
        int adr = dic[from[i]] >> 32;
        dic[from[i]] += (point)1 << 32;
        kids[adr] = to[i];
    }

    top[0] = 1;
    for (auto &elem : top)
    {
        int ways = elem.second % 999979;
        point ver = elem.first;

        for (int j = (int)(first(dic[ver]) - second(dic[ver])); j < first(dic[ver]); j++)
        {
            top[kids[j]] += ways;
        }
    }
    printf("%d\n", top[(point)n << 32 | m] % 999979);
}
