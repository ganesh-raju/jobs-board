import React from "react";

import axios from "axios";


class SignUp extends React.Component {

    constructor(){
        super()

        this.state = {
            email: "",
            password: "",
            confirm_password: ""
        }
    }

    handleSubmit = e =>{
        e.preventDefault();
        const {email, password, confirm_password} = this.state
        axios.post("/users", { users: {email: email, password: password, confirm_password: confirm_password}})
        .then(res => {
            console.log(res.data);
        })
    }

    handleChange = e => {
        e.preventDefault;
        const {name, value} = e.target;
        this.setState({
            [name]: value
        })
    }

    render(){
        return(
            <div>
                <form onSubmit={this.handleSubmit}>
                    <input type="email" name="email" onChange={this.handleChange}></input>
                    <input type="password" name="password" onChange={this.handleChange}></input>
                    <input type="password" name="confirm_password" onChange={this.handleChange}></input>
                    <button type="submit"> Sign Up
                    </button>
                </form>
            </div>
        )
    }

};
export default SignUp;