This talk about is about adjacency labelling schemes for planar graphs and is joint work with Vida Dujmović, Louis Esperet, Cyril Gavoille, and Gwenaël Joret.
---
Let A be a function that takes pairs of binary strings as inputs and outputs a single bit.  Now take a graph G and label its vertices with binary strings. We say that this labelling of G works with A if the following conditions are satisfied
- when given the labels of any two adjacent vertices in G, A outputs 1
- when given the labels of any two non-adjacent vertices in G, A outputs 0.

We refer to A as an adjacency-tester.
---
We say that a graph family has an f(n) bit labelling scheme if there exists a single adjacency tester A such that each n-vertex member of the family has a labelling using labels of length f(n) that works with A

The example shown here uses an adjacency tester A that returns 1 if and only if the Hamming distance between its two inputs is 1.  The graph illustrated here is a 3-cube.  The labelling is the standard labelling of the 3-cube using labels of length 3.  This generalizes to the $d$-cube and shows that the family of hypercubes has a (log n)-bit labelling scheme.
---
Adjacency labelling schemes are closely related to so-called universal graphs.  If a graph family has an f(n)-bit labelling scheme then, for each integer n there is a universal graph U_n with 2^{f(n)} vertices such that each n-vertex member of the family appears as an induced subgraph of U_n.

The graph U_n is easy to define. Its vertex set consists of all f(n) bit binary strings and an edge vw is present in U_n if and only if the adjacency tester A outputs 1 given the binary strings v and w.
---
Nearly optimal adjacency labelling schemes and universal graphs for trees and forests have been known since the work of Chung on universal graphs in 1990.  Work in this area has recently culminated with the result of Alstrup, Dahlgaard, and Knudsen, who give a (log n + O(1))-bit labelling scheme for the family of forests.  This is optimal up to the constant additive term.

As part of their work on planar graphs, Gavoille and Labourel showed that the class of bounded treewidth Graphs have near-optimal labelling schemes.
---
Work on adjacency labelling schemes for planar graphs goes back at least to 1988.

- Muller's thesis described a (6log n)-bit labelling scheme based on the fact that planar graphs are 5-degenerate.

- In a STOC1988 paper, Kannan, Naor, and Rudich gave described a (4log n)-bit labelling scheme based on the fact that the edges of a planar graph can be oriented so that the maximum out-degree at any vertex is 3.

- The fact that the edges of any planar graph can be partitioned in three forests, along with the optimal labelling scheme for forests implies a $3\log n+O(1)$-bit labelling scheme for planar graphs

- Gavoille and Labourel used the fact that the edges of any planar graph can be partitioned into two graphs of treewidth-2 along with their labelling scheme for bounded treewidth graphs to obtain a 2log n + o(log n) bit labelling scheme for planar graphs.

- Very recently, Bonamy, Gavoille, and Pilipczuk used a recent product structure theorem for planar graphs to obtain a (4/3)log n - bit labelling scheme for planar graphs

- Finally, the main result in the current work, is a log n + o(log n) bit labelling scheme for planar graphs.  This work is also based on the product structure theorem for planar graphs.
---
Before we can describe the product structure theorem on which these results are based, we need to define the strong graph product.  This figure illustrates the strong product of a tree and path.

The product of two graphs A and B is the graph whose vertex set is the Cartesian product of the vertex sets of A and B. A vertex a_1 b_1 is adjacent to a vertex a_2 b_2 if one of the the following three conditions are satisfied

- a_1 = a_2 and b_1 and b_2 are adjacent in B.  These are the vertical edges in the illustration that join two vertices in the same column.

- a_1 and a_2 are adjacent in A and b_1=b_2. These are horizontal edges in the illustration that join two vertices in the same row.

- a_1 and a_2 are adjacent and A and b_1 and b_2 are adjacent in B.  These are the blue and red diagonal edges in the illustration that join vertices between distinct rows and columns.

As in the example shown here we will always be taking the strong product of some graph and a path.  In this kind of product, the vertical and diagonal edges always span two consecutive rows.
---
The product structure theorem for planar graphs states that any planar graph $G$ is the subgraph of a strong product of two very simple graphs:  a bounded treewidth graph H and a path P.

Our main result is that any family of graphs consisting of subgraphs of strong products of bounded treewidth graphs and paths has a log n + o(log n) bit labelling scheme.  This result applies to graph families considerably beyond planar graphs, including bounded-genus graphs, apex-minor free graphs, bounded degree graphs from minor-closed families, and k-planar graphs for constant k.
---
Before proving the main result in its entirety, we consider the special case, in which $G$ is an 'induced subgraph' of the strong product of two paths.  This simpler-sounding problem still contains all the major difficulties that must be overcome in a solution to general problem.

The vertices of G can be partitioned into rows numbered one through h.  We let G_i denote the subgraph of G induced by the vertices in row i.

Each vertex label has 3 parts: a row label, a column label, and a transition label.

- the row label identifies which row, i, v is in. Every vertex in the same row receives teh same row label.  The row labels are designed so that, using the row labels of two vertices we can determine if the vertices are in the same row, in two consecutive rows, or in two distinct rows that are not consecutive.  If row i contains n_i vertices of G then the label for row i will have length roughly log n - log n_i

- the column label of v is designed so that, given the column labels of two vertices in the same row, we can test if u and v are adjacent in G.  The column labels are designed so that each vertex in row $i$ receives a column label of length roughly log n_i.

- In this way, the total length of the row and column label for v is roughly log n.

The discussion so far already highlights the main difficulty.  The row labels of two vertices v and w create 3 cases:

- if v and w are it the same row then we can use their column labels to test if vw is an edge G
- if v and w are not in consecutive rows then we know that they are not adjacent
- but if v and w are in consecutive rows i and i+1 then we have a problem the column label for v is for the graph induced by row i and the column label for w is for the graph induced by row i+1.  These are different graphs, so the column labels of v and w are not compatible.

- For this reason, the label of v contains a third part, called the transition label, which contains enough information to modify the column label of v to produce a column label that is compatible with the labelling of row i+1. Then we use this modified label to test for the existence of the edge vw.

To implement these ideas we need a flexible way to label the vertices of a path.
---
One way to label the vertices of a path is to store those vertices in a binary search tree T, in the same order they occur on the path.

Each vertex v gets a unique signature obtained by recording the steps from the root of the tree to v, using a 0 for an edge leading left and 1 for an edge leading right.

In addition to this signature, each vertex implicitly stores the signature of the vertex that immediately precedes it in the path.  They key observation is that this signature has a concise encoding.  There are three cases that can be distinguished using 2 bits that a denoted by an O, an A, or an X in the illustration here.

In Case O, the predecessor v in the path is not part of the induced graph. In this case there is nothing more to encode.

In Case X, v has no left child, then the signature of v's predecessor is obtained by removing a trailing string from v's signature that consists of a 1 followed by a string of zero or more 0s.  This does not require encoding any extra information.

Finally, in Case A, v has a left child. Then the signature of v's predecessor is obtained by appending a 0 and a string of zero or more 1's to v's signature.  This can be encoding by a binary encoding of the difference in depth between v and its successor.

The code for v therefore consists of a signature, whose length is equal to the depth of v, two bits to distinguish between Case O, X, or A, and possibly a positive integer that is not greater than the height of T.  If T is at all balanced, this final integer can be encoding using O(log log n) bits.

It is important to note that the parts of the label other than the signature only contribute O(\log\log n) to the length of the label, so our discussion will mostly focus on ensuring that the signature of any node is short.
---
We will create a sequence of binary search trees T_1,..,T_h corresponding to the rows of our graph.

We want two consecutive trees in this sequence to be closely related, so the first step is to apply fractional cascading, a technique from data structures so that any two consecutive rows are not wildly different.  This does not increase the total number of vertices by more than a constant factor, but ensures that there is no long sequence of vertices that appear consecutively in row i none of which appear in row i+1, or vice-versa.

---
Before describing this tree sequence, we first dispense with the problem of finding row codes.

Since there are no restrictions on the binary search $T$ used to create these codes, we can use a biased binary search tree.  For each integer $i\in\{1,\ldots,h\}$ we assign a weight equal to the size of the tree $T_i$.

If we build a biased binary search tree using these weights then the node that contains the value $i$ will have depth log n - log |T_i| + a constant.

This means that the label for $i$ will have length log n - log |T_i| + O(loglog n), as required.

All that remains is to show that we can assign column labels to nodes so that each node in row i receives a label of length at most \log |T_i| + o(\log n).
---
Coming back now to the column labels, we will imagine the tree sequence T_1,...,T_h as a single dynamic binary search tree that undergoes changes as we move from one row to the next.  We call this structure a bulk tree since the operation of moving from row i to row i+1 involves many additions and removals.

When moving from row i to row i+1 three things happen and we need to keep track of how this changes the signatures of nodes that appear both in T_i and in T_{i+1}.  These changes determine the transition codes that are used to convert the signature of a node in T_i into a signature that can be used in T_{i+1}.

These three changes are the addition of new nodes that appear in row i+1, deletion of nodes that disappear from row i, and a rebalancing operation required to ensure that each tree T_i has a height that is very close to the logarithm of its size.
---
---
The addition of new nodes that appear in row i+1 is done using a simple algorithm.  Each new node from row i+1 has an external node in T_i that it could replace.  The fractional cascading step ensures that, for any such external node, only a constant number of new nodes could replace it.  These nodes new nodes are grouped into a perfectly balanced binary search tree whose root replaces the external node.  This does not increase the height of the tree by more than a constant.

This addition has no effect on the signatures of nodes in T_i that also appear in T_{i+1}.  Any node that appears in both trees has the same signature before and after the new vertices are added.
---
The deletion of nodes that disappear in row i+1 is done using the standard algorithm for deletion in binary search trees.  If the node is a leaf, then we simply delete that leaf.  Otherwise we replace the node with either its successor or predecessor, as illustrated here.  This can cause a sequence of nodes to change locations where each node in the sequence takes the empty place left by its predecessor in the sequence.

The key observation here is that any node that moves replaces one of its ancestors.  The only effect this has on the signature of the node is to truncate it.  Any node that is not moved by the deletion has the same signature before and after the deletion.

Therefore, for a particular node v that appears in T_i and T_{i+1}, the effects of any number of deletions on the signature of v can be summarized by a single integer that indicates how many bits to remove from the signature of v.  If T_i is at all balanced, this integer can be encoding using O(log log n) bits.

Note that deletions do not increase the depth of any node and therefore they do not increase the height of the tree.  Furthermore, fractional cascading ensure the size of T_i and T_{i+1} do not differ by more than a constant factor.  Therefore, the logarithms of their sizes do not differ by more than a constant.
---
So far, we have seen that the changes to any node's signature when performing all the insertions and deletions required to move from T_i to T_i+1 can be encoded in O(\log\log n) bits. Furthermore, if T_i has close to optimal height then T_{i+1} nearly does as well, except for a constant increase.

Over many rows, these constants add up, so some kind of rebalancing has to be done.  For this, we do a very rough rebalancing operation that works on a node x.  At the end of this operation, every node of depth k in the subtree of x contains at most 1 over 2^k nodes in the subtree of x.

Clearly this operation only affects signatures of nodes in the subtree of x.  By implementing this carefully, the changes to these signatures can be encoded in O(kloglog n) bits.

When moving from row 1 to row 2, this rebalancing operation is applied at the root of T. When moving from row 2 to row 3, it is applied simultaneously at all nodes of depth k.  When moving from row 3 to row 4, the operation is applied to all nodes of depth 2k, and so.  This continues for some number y of iterations until y*k is greater than the height of the tree.  At this point, the process repeats, beginning from root.

The analysis is intricate, but the main idea is that this operation operates on k layers of the tree at once, but the insertions and deletions performed only increase the height of the tree by a constant.  By choosing k large enough. this ensures that the height of the tree never exceeds its optimal height by more than a factor of 1+1/k.
---
This leads to a tradeoff in which the transition codes have length kloglog n and the height of the tree tree T exceeds its optimal height by at most log n/k.  Optimizing the value of k gives a total label of length of log n + O(sqrt(log nloglog n)).
---
Of course, there are many details missing from this short talk.  One of these is how the solution for the strong product of two paths can be extended to the strong product of a boundary treewidth graph and a path.  Very roughly speaking this is done by embedding H, a bounded treewidth graph, into an interval graph of logarithmic thickness, and then using a tree T that corresponds to an interval tree for the resulting set of intervals.

A final detail is that these labelling schemes have to work for all subgraphs of H times P, not just induced subgraphs.  This is handled in a fairly straightforward way by using an orientation of H times P in which edge vertex has out-degree at most d.  Then the label of each vertex includes a bit-vector of length d that indicates which of its outgoing edges in the induced graph are actually present in the subgraph.
---
This concludes a brief overview of the area and the new result.  

An obvious open problem left by this work is to determine the second-order term.  The current upper bound is O(sqrt(log n log log n)) while the only know lower bound is Omega(1).

Thank you for listening.








to go from the strong product
