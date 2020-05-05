import React from 'react';
import axios from "axios";

class JobsView extends React.Component {
    constructor(){
        super();

        this.state = {
            jobs: {}
        }
    }

    componentDidMount(){
        let job_id = this.props.location.state.job
        axios.get(`/jobs/${job_id}.json`)
        .then(res => (
            this.setState({
                jobs: res.data
            })
        ))
    }

   
    render(){
        const { title, location, salary, skills, description } = this.state.jobs
        return(
            <div className="row">
                <div className="col-md-6 col-md-offset-3">
                    <h1>{title }</h1>
                    <br />
                   
                    <p><strong>Location: </strong> { location } </p>
                    <p><strong>Salary: </strong> { salary }</p>
                    <br />
                    <p><strong>Skills: </strong> { skills }</p>
                    <br />
                    <p>
                        { description }
                    </p>
                </div>
            </div>
        )
    }
    
}

export default JobsView;