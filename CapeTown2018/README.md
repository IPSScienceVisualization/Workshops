# So you'd like to visualize some data in the Iziko Planetarium and Digital Dome...

The [Iziko Planetarium and Digital Dome](https://www.iziko.org.za/museums/planetarium) is the most advanced digital planetarium on the African continent. In addittion to being used for public planetarium shows it also servers to optimise South Africa’s eResearch and data visualisation capacity. This planetarium blends together 6 4K projectors, driven by a cluster of 12 computers (14 including the GUI machine and the audio computer). Each of these computers contains a state-of-the-art Pascal 6000 graphics card with 24GB or memory. The planetarium can actually be driven by two of these computer clusters, one that is used for public planetarium operations and one for its eResearch operations.

There are two main pathways for creating visualization inside the planetarium. One is to pre-render content (either images or videos) and diaplay that on the planetarium dome. The other is to display data using the software installed on the planetarium cluster. Both clusters have SkySkan's [Digital Sky Dark Matter software](https://www.skyskan.com/products/ds) installed. In the near future we plan to install [OpenSpace](http://openspaceproject.com/) and [Worldwide Telescope](http://worldwidetelescope.org/webclient/) on the research cluster. 

## Real-time Planetarium Data Visualization Examples

* GalaxyZoo Datasets In this example we will show how to import catalog data into DigitalSky Dark matter using the catalog of GalaxyZoo classifications.
* Dark Energy Survey dwarf galaxy discoveries. One of the advantages of visualizing datasets inside plabnetarium software such as Dark Matter, is the fact that it comes with the rest of the Universe already included. Here we will visualize a catalog of Milky Way dwarfs in the context of a beautiful volumetric MilkyWay galaxy.

## Rendered Planetarium Visualization Examples

The standard format for planetarium content known as the *domemaster*. This is a square image with a circular image inscribed. The projection is an equal angle azimuthal projection usually covering 180 degrees. For these examples we will utilize visualization that includes domemaster rendering functionality. The Iziko Planetarium has a native resolution of about 6,500 pixels across half a great. Content is rendered ideally at 8,192x8,192 (8K), although lower resolution content can be played back as well. Low resolution video content (3K? need to test) can be played back as a single file. Higher resolution content needs to be sliced and encoded into seperate movies for each computer to play back.

* [Volumetric rendering of simulation data with yt.](https://github.com/IPSScienceVisualization/Workshops/blob/master/Tokyo2017/Volumetric%20Fisheye%20Rendering%20with%20yt.ipynb) yt is an open-source, permissively-licensed python package for analyzing and visualizing volumetric data. It supports a wide variety of computational simulation formats. This Jupyter notebook shows you how to load an example cosmological simulation, construct a transfer function, and volumetrically render a domemaster frame.
* [Visualizing Event Data with Worldwide Telescope](). In this example we'll use a Jupyter notebook to pull the Fermi Gamma ray Burst catalog from the CDS using the Astroquery interface to Vizier. After some manipulations we send the data to the Windows client version of WWT using the pyWWT package. In WWT we then build a simple tour playing the GRBs back in time with the Fermi maqp in the background. The WWT tour is then rendered to a domemaster frame sequence which can be encoded to aq video (or sliced for higher resolution playback).



If you are unable to get the programming environment set up locally, you can run the code remotely here: [jupyter.adlerplanetarium.org](http://jupyter.adlerplanetarium.org). This was set up for the workshop and I make no promises on how long this link will be live.

### Hirotaka Nakayama, Data Visualization with Unity
The video for this workshop session is [here:](http://www.youtube.com/watch?v=NO4iiRdXXt0&t=4h38m25s)

* [Simple Data Viewer Unity Tutorial](https://github.com/sizima/SimpleDataViewer)
* [EQTANT Free], An excellent stiching/conversion tool that is used to create the domemaster frames from cubemaps (http://sizima.com/EQTANT.html#EQTANT)

### Doug Roberts, Worldwide Telescope
The video for this workshop session is [here:](https://www.youtube.com/watch?v=N6RDqBWzqt4&t=1h17m8s)
The presentation is [here](http://prc.nao.ac.jp/fukyu/dtod/pdf/w2.pdf)

* [WWT Workshop Content](http://wwtworkshops.org/)

### Carter Emmart, OpenSpace
The video for this workshop session is [here:](https://www.youtube.com/watch?v=N6RDqBWzqt4&t=2h30m10s)
The presentation is [here](http://prc.nao.ac.jp/fukyu/dtod/pdf/w3.pdf)

* [OpenSpace buildathon documentation](https://openspacenyc.splashthat.com/)
* [DARTS: Hyabusa Project Science Data Archive](https://darts.isas.jaxa.jp/planet/project/hayabusa/spice.html)






