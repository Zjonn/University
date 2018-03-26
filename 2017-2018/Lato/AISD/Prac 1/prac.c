#include <stdio.h>
#include <stdlib.h>

void prepareTree(int[], int[]);
void readVertices(int[], int[]);
void countAdr(int[]);
void placeChildrenOnAdr(int[], int[], int[]);
void printTree(int[], int[]);
void dfs2(int[], int[], int[], int[]);

void pushVertex(int[], int, int *);
int popVertex(int[], int *);
void removeVertex(int *);

void printInOutTime(int[], int[]);
void handleQuery(int[], int[]);

int n, m;

int main()
{
    scanf("%d %d", &n, &m);

    int *children = malloc(n * sizeof(int));
    int *adr = calloc(n + 1, sizeof(int));

    prepareTree(adr, children);
    //printTree(adr, children);

    int *in = malloc((n + 1) * sizeof(int));
    int *out = malloc((n + 1) * sizeof(int));

    dfs2(adr, children, in, out);
    //printInOutTime(in, out);
    handleQuery(in, out);
}

void prepareTree(int childAdr[], int children[])
{
    int a[n + 1];

    readVertices(childAdr, a);
    countAdr(childAdr);
    placeChildrenOnAdr(childAdr, children, a);
}

void readVertices(int childAdr[], int a[])
{
    int v;
    for (int i = 1; i < n; i++)
    {
        scanf("%d", &v);
        --v;
        a[i] = v;
        childAdr[v]++;
    }
}

void countAdr(int childAdr[])
{
    int adr = childAdr[0];
    childAdr[0] = 0;

    int v;
    for (int i = 1; i < n; i++)
    {
        v = childAdr[i];

        childAdr[i] = adr;
        adr += v;
    }
}

void placeChildrenOnAdr(int childAdr[], int children[], int a[])
{
    for (int i = 1; i < n; i++)
    {
        children[childAdr[a[i]]] = i;
        childAdr[a[i]] += 1;
    }
}

void printTree(int childAdr[], int children[])
{
    int toSkip = 0;
    for (int i = 0; i < n; i++)
    {
        printf("%d - children: ", i);

        if (toSkip > 0)
        {
            --toSkip;
            printf("\n");
            continue;
        }
        printf(" adress: %d %d ", childAdr[i - 1], childAdr[i]);
        int j = (i > 0) ? childAdr[i - 1] : 0;

        for (; j < childAdr[i]; j++)
        {
            printf("%d, ", children[j]);
        }

        toSkip = j - childAdr[i];
        printf("\n");
    }
}

void dfs2(int addrs[], int children[], int in[], int out[])
{
    int acc = 0, q = 0;

    int que[n + 2];

    pushVertex(que, 0, &q);
    for (int j = 0; j < addrs[0]; j++)
    {
        pushVertex(que, children[j], &q);
    }
    in[0] = 0;

    for (int i = 1; q != 0; i++)
    {
        acc = popVertex(que, &q);
        que[q - 1] = -que[q - 1];

        if (acc <= 0)
        {
            removeVertex(&q);
            out[-acc] = i;
            continue;
        }

        in[acc] = i;

        if (addrs[acc] == addrs[acc - 1])
        {
            removeVertex(&q);
            out[acc] = i;
            continue;
        }

        for (int j = addrs[acc - 1]; j < addrs[acc]; j++)
        {
            pushVertex(que, children[j], &q);
        }
    }
}

void pushVertex(int que[], int v, int *q)
{
    int val = *q;
    que[val] = v;
    *q = ++val;
}

int popVertex(int que[], int *q)
{
    int v = que[*q - 1];
    return v;
}

void removeVertex(int *q)
{
    *q = *q - 1;
}

void printInOutTime(int in[], int out[])
{
    for (int i = 0; i < n; i++)
    {
        printf("in: %d out: %d\n", in[i], out[i]);
    }
}

void handleQuery(int in[], int out[])
{
    int u, v;
    for (int i = 0; i < m; i++)
    {
        scanf("%d %d", &u, &v);
        u -= 1;
        v -= 1;

        if (in[u] < in[v] && out[u] > out[v])
            printf("TAK\n");
        else
            printf("NIE\n");
    }
}