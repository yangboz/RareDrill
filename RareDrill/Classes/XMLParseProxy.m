//
//  XMLParser.m
//  BrainQuiz
//
//  Created by zhou Yangbo on 11-8-15.
//  Copyright 2011 GODPAPER. All rights reserved.
//

#import "XMLParseProxy.h"
#import "SubjectsModel.h"

@implementation XMLParseProxy

@synthesize subject,subjects;

-(XMLParseProxy *)initXMLParser
{
	[super init];
	// init array of subject objects 
	subjects = [[NSMutableArray alloc] init];	
	//
	return self;
}

//Custom public functions.
-(void)parseXMLFile:(NSString *)path
{
	NSString *filePath = [[NSBundle mainBundle] pathForResource:path ofType:@"xml"];
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:filePath];
    NSData *fileData = [fileHandle readDataToEndOfFile];
    [fileHandle closeFile];
	// create and init NSXMLParser object
	NSXMLParser *nsXmlParser = [[NSXMLParser alloc] initWithData:fileData];

//	// create and init NSXMLParser object
//	NSXMLParser *nsXmlParser = [[NSXMLParser alloc] initWithContentsOfURL: url];
	
	// create and init our delegate
	XMLParseProxy *parser = [[XMLParseProxy alloc] initXMLParser];
	//set delegate
	[nsXmlParser setDelegate:parser];
	//parsing...
	BOOL success = [nsXmlParser parse];
	if (success) {
		NSLog(@"No errors - subjects count : %i", [[parser subjects] count]);
		// get array of users here
		//  NSMutableArray *users = [parser users];
	}else {
		NSLog(@"Error parsing document!!!");
	}
				
	// release
	//[parser release];
	[nsXmlParser release];
	
	//store this results to singleton model.
	[SubjectsModel setData:[[parser subjects] copy]];
//	subjectsData = [[parser subjects] copy];
	//
	//return [[[parser subjects] copy] autorelease];
}


//NSXMLParse delegate functions here.
//  <title>What's time is this?</title>

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName 
	attributes:(NSDictionary *)attributeDict   
{
	if (qName) elementName = qName;
	if (elementName) [currentElementValue appendString:@""];
	//
	if ([elementName isEqualToString:@"subject"]) {
		NSLog(@"subject element found – create a new instance of SubjectVO class...");
		subject = [[SubjectVO alloc] init];
		//We do not have any attributes in the user elements, but if
		// you do, you can extract them here: 
		// subject.att = [[attributeDict objectForKey:@"<att name>"] ...];
	}
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName
{
	if ([elementName isEqualToString:@"subjects"]) {
		// We reached the end of the XML document
		return;
	}
	if ([elementName isEqualToString:@"subject"]) {
		// We are done with user entry – add the parsed subject 
		// object to our user array
		[subjects addObject:subject];
		// release user object
		[subject release];
		subject = nil;
	} else {
		// The parser hit one of the element values. 
		// This syntax is possible because SubjectVO object 
		// property names match the XML subject element names   
		[subject setValue:currentElementValue forKey:elementName];
	}
	
	[currentElementValue release];
	currentElementValue = nil;
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	if (!currentElementValue) {
		// init the element string with the value     
		currentElementValue = [[NSMutableString alloc] initWithString:@""];
	} else {
		// append value to the element string   
		[currentElementValue appendString:string];
	}
	NSLog(@"Processing value for : %@", string);
}

//
-(void) parserDidStartDocument:(NSXMLParser *)parser {
	NSLog(@"parserDidStartDocument!!!"); 	
}

-(void) parserDidEndDocument: (NSXMLParser *)parser {
	NSLog(@"parserDidEndDocument!!!"); 
}




@end
