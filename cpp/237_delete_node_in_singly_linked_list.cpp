/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
public:
    void deleteNode(ListNode* node) {
        ListNode* current = node;
        while (current != NULL) { 
            ListNode* temp = current->next;
            if (temp != NULL) {
                current->val = temp->val;
                if (temp->next == NULL) {
                    current->next = NULL;
                }
            } 
            current = temp;
        }
    }
};