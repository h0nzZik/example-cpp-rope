// https://en.wikipedia.org/wiki/Rope_(data_structure)

export module rope;

import <string>;
import <variant>;
import <memory>;

struct Leaf;
struct InnerNode;
using Node = std::variant<Leaf, InnerNode>;

struct Leaf {
    std::string s;
    size_t weight;
};

struct InnerNode {
    std::string s;
    size_t weight;
    size_t sum_of_lengths_of_left_subtree;
    std::unique_ptr<Node> left;
    std::unique_ptr<Node> right;
};


// Collect leaves
// --------------
// Create a stack S and a list L.
// Traverse down the left-most spine of the tree until you reach a leaf l',
// adding each node N to S. Add l' to L.
// The parent of l' (p) is at the top of the stack.
// Repeat the procedure for p's right subtree.
//
// TODO: implement


// Rebalance
// ---------
// Collect the set of leaves L and rebuild the tree from the bottom-up.


class Rope {
private:
    Node root;


public:

};


export
int rope_something() {
    return 3;
}

