#include <iostream>
#include <string>
#include <stack>

using namespace std;

struct Node {
    string value;
    Node* left;
    Node* right;
};

Node* newNode(string v) {
    Node* temp = new Node;
    temp->left = temp->right = NULL;
    temp->value = v;
    return temp;
}

bool isOperator(char c) {
    if (c == '+' || c == '-' || c == '*' || c == '/') {
        return true;
    }
    return false;
}

Node* constructTree(string postfixExpression) {
    stack<Node*> st;
    Node* t, *t1, *t2;

    for (int i = 0; i < postfixExpression.length(); i++) {
        if (!isOperator(postfixExpression[i])) {
            t = newNode(string(1, postfixExpression[i])); // convert char to string
            st.push(t);
        }
        else {
            t = newNode(string(1, postfixExpression[i])); // convert char to string

            t1 = st.top();
            st.pop();
            t2 = st.top();
            st.pop();

            t->right = t1;
            t->left = t2;

            st.push(t);
        }
    }

    t = st.top();
    st.pop();

    return t;
}

int eval(Node* root) {
    if (root == NULL)
        return 0;

    if (!root->left && !root->right)
        return stoi(root->value);

    int left_sum = eval(root->left);
    int right_sum = eval(root->right);

    if (root->value == "+")
        return left_sum + right_sum;

    if (root->value == "-")
        return left_sum - right_sum;

    if (root->value == "*")
        return left_sum * right_sum;

    return left_sum / right_sum;
}

int main() {
    string postfixExpression;
    cout << "Enter the postfix expression: ";
    cin >> postfixExpression;
    Node* r = constructTree(postfixExpression);
    cout << "The result of the expression is: " << eval(r) << endl;
    return 0;
} 
