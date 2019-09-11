using System;
using Xunit;
using DevOpsWorld.Client.Controllers;
using Microsoft.AspNetCore.Mvc;

namespace DevOpsWorld.Test{
    public class HomeUnitTest
    {
        [Fact]
        public void TestIndex(){

					var home = new HomeController();
					var view = home.Index();
					Assert.NotNull(view);
					Assert.IsType<ViewResult>(view);
        }

				[Fact]
        public void TestPrivacy(){

					var home = new HomeController();
					var view = home.Privacy();
					Assert.NotNull(view);
        }
    }
}
