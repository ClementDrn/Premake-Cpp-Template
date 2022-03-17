--- Solution -------------------------------
workspace "SolutionName"
   
	configurations { 
	   "Debug", 
	   "Release"
	}

	platforms {
		"x86",
		"x64"
	}

	startproject "ProjectName"

	filter "platforms:x86"
		architecture "x86"

	filter "platforms:x64"
		architecture "x86_64"


--- Variables ------------------------------
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

includedir = {}
--includedir["LibraryName"] = "ProjectDir/vendor/LibraryDir/include"


--- Dependencies ---------------------------
group "Dependencies"
--include "ProjectDir/vendor/OtherPremakeProjectDir"
group ""


--- ProjectName --------------------------------
project "ProjectName"

	location "ProjectDir"
	language "C++"
	cppdialect "C++20"
	staticruntime "on"

	targetdir("bin/" .. outputdir .. "/%{prj.name}")
	objdir("obj/" .. outputdir .. "/%{prj.name}")

	files {
		"%{prj.name}/src/**.hpp",
		"%{prj.name}/src/**.cpp",
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.c",
	}

	includedirs {
		--"%{includedir.LibraryName}
	}

	defines {
	
	}

	filter "system:windows"
		entrypoint "mainCRTStartup"
		systemversion "latest"
		libdirs {

		}
	
	filter {}
	links {

	}

	filter "configurations:Debug"
		kind "ConsoleApp"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		--kind "WindowedApp"
		kind "ConsoleApp"
		runtime "Release"
		optimize "on"
