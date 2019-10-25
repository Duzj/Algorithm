#include <stdio.h>

// 链表节点
struct ListNode {
    int value;
    struct ListNode *next;   
};

// 翻转单链表

struct ListNode * reverseList(struct ListNode *head){
    if (head == NULL)
    {
        return NULL;
    }
    
    if (head->next == NULL)
    {
        return head;
    }
    
    struct ListNode *reversedHead = NULL;
    struct ListNode *preNode = NULL;
    struct ListNode *currentNode = head;

    while (currentNode != NULL)
    {
        struct ListNode *nextNode = currentNode->next;
        if (nextNode == NULL)
        {
            reversedHead = currentNode;
        }
        
        currentNode->next = preNode;
        preNode = currentNode;
        currentNode = nextNode;
    }
    return reversedHead;    
}

int main(void){
    struct ListNode *h1 ;
    struct ListNode *h2 ;
    struct ListNode *h3 ;
    struct ListNode *h4 ;
    h1->value = 1;
    h1->next = NULL;
    h2->value = 2;
    h2->next = h1;
    h3->value = 3;
    h3->next = h2;
    h4->value = 4;
    h4->next = h3;
    
    struct ListNode *re = reverseList(h4);
    struct ListNode *current = re;
    
    while (current != NULL)
    {
        /* code */
        printf("%p",current);

        printf("%d", current->value);
        struct ListNode *temp = current->next;

        current = temp;
    }
    
}