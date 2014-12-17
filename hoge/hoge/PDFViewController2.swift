//
//  PDFViewController2.swift
//  hoge
//
//  Created by Kaito Oshiro on 2014/12/17.
//  Copyright (c) 2014年 team-g. All rights reserved.
//

import Foundation

import UIKit;

class PDFViewController2 : ViewController {
    - (void)loadView {
    [super loadView];
    
    //横向き対応
    self.view.frame = CGRectMake(0, 0, 1024, 748);
    
    //Resourceからpdfファイルのurlを取得
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"dummy" withExtension:@"pdf"];
    CGPDFDocumentRef pdf = CGPDFDocumentCreateWithURL((CFURLRef)url);
    
    //pdfのページ数を取得
    int pageCount = CGPDFDocumentGetNumberOfPages(pdf);
    
    //pdfを表示するためのスクロールビューを追加
    scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    //scrollView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:scrollView];
    
    //スクロールビューの縦サイズを保持する変数（ページごとにサイズが変わることがあるかわからないので念のため）
    float contentHeight = 0;
    
    for (int i=1; i<=pageCount; i++) {
    //pdfの各ページを取得
    CGPDFPageRef page = CGPDFDocumentGetPage(pdf, i);
    
    //pageを保持宣言
    CGPDFPageRetain(page);
    
    //ページのサイズを取得
    CGRect pageRect = CGPDFPageGetBoxRect(page, kCGPDFMediaBox);
    
    //ページのサイズと実表示サイズからスケール値を取得
    float pdfScale = self.view.frame.size.width / pageRect.size.width;
    
    //比率をもとにサイズ修正
    pageRect.size = CGSizeMake(pageRect.size.width * pdfScale, pageRect.size.height * pdfScale);
    
    //各ページ頂点
    pageRect.origin = CGPointMake(0, pageRect.size.height*(i-1));
    
    //スクロールビューの縦サイズに追加
    contentHeight += pageRect.size.height;
    
    //contextを使用して背景描画とイメージを反転させる
    UIGraphicsBeginImageContext(pageRect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 1.0);
    CGContextFillRect(context, pageRect);
    CGContextSaveGState(context);
    
    
    CGContextTranslateCTM(context, 0.0, pageRect.size.height);
    CGContextScaleCTM(context, pdfScale, -pdfScale);
    
    CGContextDrawPDFPage(context, page);
    CGContextRestoreGState(context);
    
    UIImage *uiImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:uiImage];
    imageView.frame = pageRect;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [scrollView addSubview:imageView];
    
    [imageView release];
    CGPDFPageRelease(page);
    
    }
    
    CGPDFDocumentRelease(pdf);
    scrollView.contentSize = CGSizeMake(1024, contentHeight);
    }
}