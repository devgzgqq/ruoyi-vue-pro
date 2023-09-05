package cn.iocoder.yudao.module.training.framework.web.config;

import cn.iocoder.yudao.framework.swagger.config.YudaoSwaggerAutoConfiguration;
import org.springdoc.core.GroupedOpenApi;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration(proxyBeanMethods = false)
public class TrainingWebConfiguration {

    @Bean
    public GroupedOpenApi trainingGroupedOpenApi() {
        return YudaoSwaggerAutoConfiguration.buildGroupedOpenApi("training");
    }
}
