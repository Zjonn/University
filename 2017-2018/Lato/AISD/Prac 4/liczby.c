#include <stdlib.h>
#include <stdio.h>

#define MAX_SIZE 50010
#define EMPTY -1

typedef struct
{
    int left, right;
    int up, bf;
    long key;
} node;

int start = 0, end = MAX_SIZE - 1;
int free_que[MAX_SIZE];

node nodes[MAX_SIZE];
int root = EMPTY;

void insert(long);
int delete (long);
int findNode(long);
int removeNode(int);
int prevNode(int);
int upper(long);
int lower(long);

void RR(int);
void LL(int);
void RL(int);
void LR(int);

int pop();
void push(int);

int main()
{
    for (int i = 0; i < MAX_SIZE; i++)
    {
        free_que[i] = i;
    }

    int ops;
    scanf("%d\n", &ops);

    for (int i = 0; i < ops; i++)
    {
        char op;
        long num;
        int n;
        scanf("%c %ld\n", &op, &num);

        switch (op)
        {
        case 'I':
            insert(num);
            break;
        case 'D':
            if (delete (num))
                printf("BRAK\n");
            else
                printf("OK\n");
            break;
        case 'U':
            if ((n = upper(num)) == EMPTY)
                printf("BRAK\n");
            else
                printf("%ld\n", nodes[n].key);
            break;
        case 'L':
            if ((n = lower(num)) == EMPTY)
                printf("BRAK\n");
            else
                printf("%ld\n", nodes[n].key);
            break;
        }
    }
}

void RR(int A)
{
    int B = nodes[A].right, p = nodes[A].up;
    nodes[A].right = nodes[B].left;
    if (nodes[A].right != EMPTY)
        nodes[nodes[A].right].up = A;

    nodes[B].left = A;
    nodes[B].up = p;
    nodes[A].up = B;

    if (p != EMPTY)
    {
        if (nodes[p].left == A)
            nodes[p].left = B;
        else
            nodes[p].right = B;
    }
    else
        root = B;

    if (nodes[B].bf == -1)
        nodes[A].bf = nodes[B].bf = 0;
    else
    {
        nodes[A].bf = -1;
        nodes[B].bf = 1;
    }
}

void LL(int A)
{
    int B = nodes[A].left, p = nodes[A].up;

    nodes[A].left = nodes[B].right;

    if (nodes[A].left != EMPTY)
        nodes[nodes[A].left].up = A;

    nodes[B].right = A;
    nodes[B].up = p;
    nodes[A].up = B;

    if (p != EMPTY)
    {
        if (nodes[p].left == A)
            nodes[p].left = B;
        else
            nodes[p].right = B;
    }
    else
        root = B;

    if (nodes[B].bf == 1)
        nodes[A].bf = nodes[B].bf = 0;
    else
    {
        nodes[A].bf = 1;
        nodes[B].bf = -1;
    }
}

void RL(int A)
{
    int B = nodes[A].right, C = nodes[B].left, p = nodes[A].up;

    nodes[B].left = nodes[C].right;
    if (nodes[B].left != EMPTY)
        nodes[nodes[B].left].up = B;

    nodes[A].right = nodes[C].left;
    if (nodes[A].right != EMPTY)
        nodes[nodes[A].right].up = A;

    nodes[C].left = A;
    nodes[C].right = B;
    nodes[C].up = p;
    nodes[A].up = nodes[B].up = C;

    if (p != EMPTY)
    {
        if (nodes[p].left == A)
            nodes[p].left = C;
        else
            nodes[p].right = C;
    }
    else
        root = C;

    if (nodes[C].bf == -1)
        nodes[A].bf = 1;
    else
        nodes[A].bf = 0;

    if (nodes[C].bf == 1)
        nodes[B].bf = -1;
    else
        nodes[B].bf = 0;

    nodes[C].bf = 0;
}
void LR(int A)
{
    int B = nodes[A].left, C = nodes[B].right, p = nodes[A].up;

    nodes[B].right = nodes[C].left;
    if (nodes[B].right != EMPTY)
        nodes[nodes[B].right].up = B;

    nodes[A].left = nodes[C].right;
    if (nodes[A].left != EMPTY)
        nodes[nodes[A].left].up = A;

    nodes[C].right = A;
    nodes[C].left = B;
    nodes[C].up = p;
    nodes[A].up = nodes[B].up = C;

    if (p != EMPTY)
    {
        if (nodes[p].left == A)
            nodes[p].left = C;
        else
            nodes[p].right = C;
    }
    else
        root = C;

    if (nodes[C].bf == 1)
        nodes[A].bf = -1;
    else
        nodes[A].bf = 0;

    if (nodes[C].bf == -1)
        nodes[B].bf = 1;
    else
        nodes[B].bf = 0;

    nodes[C].bf = 0;
}

void insert(long k)
{
    int w, p, r;
    int t;

    w = pop();
    nodes[w].left = nodes[w].right = nodes[w].up = EMPTY;
    nodes[w].key = k;
    nodes[w].bf = 0;

    p = root;
    if (p == EMPTY)
        root = w;
    else
    {
        while (1)
        {
            if (k == nodes[p].key)
                return;
            if (k < nodes[p].key)
            {
                if (nodes[p].left == EMPTY)
                {
                    nodes[p].left = w;
                    break;
                }
                p = nodes[p].left;
            }
            else
            {
                if (nodes[p].right == EMPTY)
                {
                    nodes[p].right = w;
                    break;
                }
                p = nodes[p].right;
            }
        }

        nodes[w].up = p;

        if (nodes[p].bf)
            nodes[p].bf = 0;
        else
        {
            nodes[p].bf = (nodes[p].left == w) ? 1 : -1;

            r = nodes[p].up;
            t = 0;

            while (r != EMPTY)
            {
                if (nodes[r].bf)
                {
                    t = 1;
                    break;
                }

                nodes[r].bf = (nodes[r].left == p) ? 1 : -1;

                p = r;
                r = nodes[r].up;
            }

            if (t)
            {
                if (nodes[r].bf == 1)
                {
                    if (nodes[r].right == p)
                        nodes[r].bf = 0;
                    else if (nodes[p].bf == -1)
                        LR(r);
                    else
                        LL(r);
                }
                else
                {
                    if (nodes[r].left == p)
                        nodes[r].bf = 0;
                    else if (nodes[p].bf == 1)
                        RL(r);
                    else
                        RR(r);
                }
            }
        }
    }
}

int delete (long k)
{
    int node;
    if ((node = findNode(k)) != EMPTY)
    {
        push(removeNode(node));
        return 0;
    }
    return 1;
}

int findNode(long k)
{
    int p = root;
    while (p != EMPTY && nodes[p].key != k)
        p = (k < nodes[p].key) ? nodes[p].left : nodes[p].right;
    return p;
}

int removeNode(int x)
{
    int t, y, z;
    int isNotRoot;
    //printf("%d %d %d\n", x, nodes[x].left, nodes[x].right);

    if (nodes[x].left != EMPTY && nodes[x].right != EMPTY)
    {
        y = removeNode(prevNode(x));
        isNotRoot = 0;
    }
    else
    {
        if (nodes[x].left != EMPTY)
        {
            y = nodes[x].left;
            nodes[x].left = EMPTY;
        }
        else
        {
            y = nodes[x].right;
            nodes[x].right = EMPTY;
        }
        nodes[x].bf = 0;
        isNotRoot = 1;
    }

    if (y != EMPTY)
    {
        nodes[y].left = nodes[x].left;
        if (nodes[y].left != EMPTY)
            nodes[nodes[y].left].up = y;

        nodes[y].right = nodes[x].right;
        if (nodes[y].right != EMPTY)
            nodes[nodes[y].right].up = y;
            
        nodes[y].up = nodes[x].up;

        nodes[y].bf = nodes[x].bf;
    }

    if (nodes[x].up != EMPTY)
    {
        if (nodes[nodes[x].up].left == x)
            nodes[nodes[x].up].left = y;
        else
            nodes[nodes[x].up].right = y;
    }
    else
        root = y;

    if (isNotRoot)
    {
        z = y;
        y = nodes[x].up;
        while (y != EMPTY)
        {
            if (!nodes[y].bf)
            {
                nodes[y].bf = (nodes[y].left == z) ? -1 : 1;
                break;
            }
            else
            {
                if (((nodes[y].bf == 1) && nodes[y].left == z) || ((nodes[y].bf == -1) && nodes[y].right == z))
                {
                    nodes[y].bf = 0;
                    z = y;
                    y = nodes[y].up;
                }
                else
                {
                    t = (nodes[y].left == z) ? nodes[y].right : nodes[y].left;
                    if (!nodes[t].bf)
                    {
                        if (nodes[y].bf == 1)
                            LL(y);
                        else
                            RR(y);
                        break;
                    }
                    else if (nodes[y].bf == nodes[t].bf)
                    {
                        if (nodes[y].bf == 1)
                            LL(y);
                        else
                            RR(y);
                        z = t;
                        y = nodes[t].up;
                    }
                    else
                    {
                        if (nodes[y].bf == 1)
                            LR(y);
                        else
                            RL(y);
                        z = nodes[y].up;
                        y = nodes[z].up;
                    }
                }
            }
        }
    }
    return x;
}

int prevNode(int x)
{
    int r;
    if (x != EMPTY)
    {
        if (nodes[x].left != EMPTY)
        {
            x = nodes[x].left;
            while (nodes[x].right != EMPTY)
                x = nodes[x].right;
        }
        else
        {
            do
            {
                r = x;
                x = nodes[x].up;
            } while (x != EMPTY && nodes[x].right != r);
        }
    }
    return x;
}

int upper(long k)
{
    //Zwraca liczbę y ∈ P, taką że y >= ­x i y jest najmniejszą liczbą o takiej własności.
    int y = EMPTY;
    int p = root;
    while (p != EMPTY)
    {
        if (nodes[p].key >= k)
        {
            y = p;
            break;
        }
        p = nodes[p].right;
    }
    if (y == EMPTY)
        return y;

    while (p != EMPTY)
    {
        y = (nodes[y].key > nodes[p].key && nodes[p].key >= k) ? p : y;
        if (nodes[y].key == k)
            break;

        p = (nodes[p].key > k) ? nodes[p].left : nodes[p].right;
    }
    return y;
}

int lower(long k)
{
    //Zwraca liczbę y ∈ P, taką że y <= x i y jest największą liczbą o takiej własności.
    int y = EMPTY;
    int p = root;
    while (p != EMPTY)
    {
        if (nodes[p].key <= k)
        {
            y = p;
            break;
        }
        p = nodes[p].left;
    }
    if (y == EMPTY)
        return y;

    while (p != EMPTY)
    {
        y = (nodes[y].key < nodes[p].key && nodes[p].key <= k) ? p : y;
        if (nodes[y].key == k)
            break;

        p = (nodes[p].key > k) ? nodes[p].left : nodes[p].right;
    }
    return y;
}

int pop()
{
    int pos = free_que[start];
    start = (++start >= MAX_SIZE) ? 0 : start;
    return pos;
}

void push(int pos)
{
    end = (++end >= MAX_SIZE) ? 0 : end;
    free_que[end] = pos;
}