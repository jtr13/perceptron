perceptron
================
Joyce Robbins
8/13/2018

The perceptron is a simple algorithm that learns to classify inputs into
two classes by adjusting the weights (w) in the equation \(y_i =\)
sign\((w_ix_i)\) until all inputs in a training set are correctly
classified. Here the steps of algorithm will be presented visually in
two-dimensional space.

### The basics

We start by plotting \((x_1, x_2)\), coloring each point by class. Note
that the points can be separated by a line; if this is not the case, the
algorithm won’t work.

![](perceptron_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

We start with an arbitrary weight vector, \((w0, w1, w2)\). Often
\((0, 0, 0)\) is used, but we’ll start with \((\) 0, 0.5, 0.5 \()\) so
we can visualize it:

![](perceptron_files/figure-gfm/weightvector-1.png)<!-- -->

The decision boundary, or hyperplane, is the line orthogonal to the
weight vector. For points on the line, the sign of \((w_ix_i)\) equals
zero. On one side of the line, the sign of \((w_ix_i)\) is greater than
zero whereas on the other side the sign of \((w_ix_i)\) is less than
zero; hence the line serves to divide all points into two classes
according to the perceptron logic.

![](perceptron_files/figure-gfm/hyperplane-1.png)<!-- -->

Note the circled points – these are the misclassified points – the ones
for which \(y_i \neq\) sign\((w_ix_i)\).

![](perceptron_files/figure-gfm/circlepoints-1.png)<!-- -->

### The Algorithm

The perceptron algorithm works by updating the weight vector based on a
randomly selected misclassified point, calculating the new hyperplane,
and repeating until the hyperplane separates all points into the two
classes.

The formula for the new weight vector is:

\(w_{t+1} = w_t + \eta y_i x_i\), where

\(x_i =\) the misclassified point

\(y_i =\) the true label of the misclassified point (-1 or 1)

\(\eta =\) the learning rate, which we’ll set to 1 for the sake of
simplicity

Visually, the new weight vector, \(w_{t+1}\), is determined by adding
\(y_ix_i\) to \(w_t\) and then shifting by the offset \(w_0/||w||_2\).

We’ll go through the algorithm one step at a time.

We begin with our original weight vector and hyperplane:

![](perceptron_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

Next we randomly select a misclassified point. In the diagram below,
\(x_i\) is shown as a **dashed blue arrow**, and \(y_ix_i\) added to
\(w_t\) as a **solid blue arrow**:

![](perceptron_files/figure-gfm/step1-1.png)<!-- -->

Next we determine the new weight vector by shifting the vector sum by
\(w_0/||w||_2\):

![](perceptron_files/figure-gfm/step2-1.png)<!-- -->

Finally, we draw the new
hyperplane:

![](perceptron_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-2.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-3.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-4.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-5.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-6.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-7.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-8.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-9.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-10.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-11.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-12.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-13.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-14.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-15.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-16.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-17.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-18.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-19.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-20.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-21.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-22.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-23.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-24.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-25.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-26.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-27.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-28.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-29.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-30.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-31.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-32.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-33.png)<!-- -->![](perceptron_files/figure-gfm/unnamed-chunk-5-34.png)<!-- -->

### Summary of 13 iterations:

![](perceptron_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->
