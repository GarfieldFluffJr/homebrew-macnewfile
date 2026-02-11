cask "macnewfile" do                                                                                                          
    version "3.0.0"                                                                                                             
    sha256 "f046d587af14c36ce6a3d90e7b1c199e257d234bfc4ad5ce0a1703c3054291c0"                                                   
                                                                                                                                
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