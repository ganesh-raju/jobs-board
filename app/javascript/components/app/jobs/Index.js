import React from 'react'
import axios from "axios";
import { withRouter } from "react-router-dom";
class Index extends React.Component {
    constructor(){
        super();

        this.state = {
            jobs: []
        }
    }

    componentDidMount(){
        axios.get("/jobs.json")
        .then((res) => {
            this.setState({
                jobs: res.data
            })
        })
    }
    render(){
        const {jobs} = this.state;
        return(
            <div>
                <div class="row text-center">
                    <h1>List of Jobs</h1>
                </div>
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        {
                            jobs.map(res => (
                                <div key={res.id}>
                                    <h3 onClick={() => this.props.history.push(`${this.props.match.url}/${res.title.toLowerCase().replace(/[^a-zA-Z0-9]/g,'_')}`, {job: `${res.id}`})}>{res.title}</h3>
                                    <p><strong>Location:</strong> {res.location}</p>
                                </div>
                            ))
                        }
                    </div>
                </div>
            </div>
        )
    }
    
}

export default withRouter(Index);