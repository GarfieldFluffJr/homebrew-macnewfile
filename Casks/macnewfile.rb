cask "macnewfile" do                                                                                                          
    version "2.1.0"                                                                                                             
    sha256 "230a209d67bbf81c2bf56291918c12c757b0ab72586a449cf218ea26dbd0e234"                                                   
                                                                                                                                
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