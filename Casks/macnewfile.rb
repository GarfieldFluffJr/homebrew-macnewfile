cask "macnewfile" do                                                                                                          
    version "3.1.1"                                                                                                             
    sha256 "bbe61094c61cd2396d7a7a94797f03e7ce6190034d96ed05a98f3147dc95e77d"                                                   
                                                                                                                                
    url "https://github.com/GarfieldFluffJr/MacNewFile/releases/download/v#{version}/MacNewFile.zip"                            
    name "MacNewFile"                                                                                                           
    desc "Create new files from Finder right-click menu"                                                                        
    homepage "https://github.com/GarfieldFluffJr/MacNewFile"                                                                    
                                                                                                                                
    depends_on macos: ">= :ventura"                                                                                             
                                                                                                                                
    app "MacNewFile.app"                                                                                                        
                                                                                                                                
    postflight do                                                                                                               
      system_command "/usr/bin/xattr",                                                                                          
                     args: ["-cr", "#{appdir}/MacNewFile.app"]                                                                  
    end                                                                                                                         
                                                                                                                                
    uninstall quit: "com.louieyin.MacNewFile"                                                                                   
                                                                                                                                
    zap trash: [                                                                                                                
      "~/Library/Preferences/com.louieyin.MacNewFile.plist",                                                                    
      "~/Library/Group Containers/group.com.louieyin.MacNewFile",                                                               
    ]                                                                                                                           
  end