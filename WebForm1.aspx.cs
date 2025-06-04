using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InteriorDesign
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTimelineData();
            }

        }
        protected void StartProjectBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("StartProject.aspx");
        }
        private void LoadTimelineData()
        {
            var timelineSteps = new List<TimelineStep>
            {
                new TimelineStep
                {
                    StepNumber = 1,
                    Title = "Book Appointment",
                    ImageUrl = "https://www.asenseinterior.com/assets/uploads/b6cd19f9ecc2bc622248f40882b640db.webp"
                },
                new TimelineStep
                {
                    StepNumber = 2,
                    Title = "Design Starts",
                    ImageUrl = "https://www.asenseinterior.com/assets/uploads/4195f8a4f3a3124f22944dd01f78e860.webp"
                },
                new TimelineStep
                {
                    StepNumber = 3,
                    Title = "Execution Phase",
                    ImageUrl = "https://www.asenseinterior.com/assets/uploads/9a737749f5e38f37d4d902c89e211aba.webp"
                },
                new TimelineStep
                {
                    StepNumber = 4,
                    Title = "Installation Phase",
                    ImageUrl = "https://www.asenseinterior.com/assets/uploads/fa830a9c5dc161ef570090ad3cd0771d.webp"
                },
                new TimelineStep
                {
                    StepNumber = 5,
                    Title = "Move in",
                    ImageUrl = "https://www.asenseinterior.com/assets/uploads/10895babad4587462671ba70b6641b15.webp"
                }
            };

            TimelineRepeater.DataSource = timelineSteps;
            TimelineRepeater.DataBind();
        }
    }

    public class TimelineStep
    {
        public int StepNumber { get; set; }
        public string Title { get; set; }
        public string ImageUrl { get; set; }
    }

}
    