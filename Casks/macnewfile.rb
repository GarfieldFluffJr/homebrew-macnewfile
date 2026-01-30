cask "macnewfile" do                                                                                                          
    version "2.0.0"                                                                                                             
    sha256 "aef1d24ce866dcedf2dcc37324344090a03d5690e7dc99c44094c9a3eebc9b28"                                                   
                                                                                                                                
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