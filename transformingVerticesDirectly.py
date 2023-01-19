#!/usr/bin/env python
# coding: utf-8


"""This demo shows how to explicitly transform the vertices 
of a .ply shape. """

from vedo import dataurl, Mesh, show
import numpy as np


# Reads the mesh data (.ply file) from a given URL location
spider = Mesh(dataurl+"spider.ply")

# Activate the shadow along the z-axis (i.e., light source points down on the z-axis) 
spider.add_shadow('z', 0, alpha=0.5)

# Display spider with z-axis up 
show(spider, axes=2, viewup="z").close()


# Get the numpy array containing the coordinates 
# of the vertices
pts = spider.points()


# Check the shape to ensure the dimensions will be correct when 
# performing matrix multiplication (transformations)
pts.shape


# We want a 3xN matrix so transpose matrix of points to be 3xN
pts = pts.transpose()


# Scaling transformation (explict form)
S = np.array(
    [[2.0, 0.0, 0.0], 
     [0.0, 0.5, 0.0],
     [0.0, 0.0, 1.0]])


# Apply the transformation (matrix multiplication). We could also use 
# np.dot()
pts_ = S @ pts
#pts_ = np.dot(S,pts)
print(pts_)


# Make a copy of the original shape
spider2 = spider.clone();

# Set the vertices of the new (transformed) shape
spider2.points(pts_)

# Change the color to red
spider2.c("red")

# Show transformed shape
show(spider,spider2, axes=2, viewup="z", title="Scaled shape").close()






