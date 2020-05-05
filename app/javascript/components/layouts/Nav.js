import React from 'react'
import { Link } from "react-router-dom";

const Nav = () => {
    return(
        <nav class="navbar navbar-default">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                        <Link to="/" className="navbar-brand"><strong>JobBoard</strong></Link>
                    </div>

                
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                    
                    
                        
                    </ul>
                    
                    <ul class="nav navbar-nav navbar-right" id="nav_links">
                        <li><a href="#"><i class="fa fa-lg fa-dot-circle-o"></i></a></li>
                        
                        <li>
                            <Link to="/about">About</Link>
                        </li>
                        <li>
                            <Link to="/jobs">Jobs</Link>
                        </li>
                        <li><a href="/companies">Companies</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    )
}

export default Nav;