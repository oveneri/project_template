workspace "ProjectTemplate"
   configurations { "Debug", "Release" }

project "ProjectTemplate"
	kind "ConsoleApp"
	language "C++"

	debugdir ("../tmp/%{cfg.buildcfg}")
	targetdir ("../tmp/%{cfg.buildcfg}")
	objdir "../tmp/obj/%{cfg.buildcfg}"
	
   includedirs { "../src/", "../externals/" }
   
   files {  "../src/**.h"
         } 
	
	filter {}
		 
	flags { "NoPCH", "FatalWarnings"}
	
	vectorextensions "SSE2"
	
	optimization_flags = { "OptimizeSpeed" }
		 
	defines { "_USE_MATH_DEFINES", "_CRT_SECURE_NO_WARNINGS" } 

   filter { "configurations:Debug" }
      defines { "DEBUG" }
      symbols "On"
	  
   filter { "configurations:Release" }
      defines { "NDEBUG" }
      optimize "On"
	  
