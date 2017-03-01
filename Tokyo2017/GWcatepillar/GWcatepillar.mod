filepath +:./modules/GWcatepillar/

coord
{
	name		GWcatepillar_c
	parent		Earth
	scale			100
	unit			1000
	unitname		1 m
	entrydist		500
	
	position
	{
	static 0 60000 0
	}
	
	rotation 
	{
	static hpr 0 0 0
	}
}
object GWcatepillar sgOrbitalObject
{
    coord GWcatepillar_c
    geometry SG_USES GWcatepillar.conf

    off

    cameraradius 0.001
    targetradius 1.0
    scale 100
    lsize			3000000

    guiName /KavliLecture/Mavalvala/GWcatepillar
}
