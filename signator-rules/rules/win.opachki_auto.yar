rule win_opachki_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.opachki."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.opachki"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { 5e c9 c20800 8bc3 2b45f8 ebf2 }
            // n = 6, score = 300
            //   5e                   | pop                 esi
            //   c9                   | leave               
            //   c20800               | ret                 8
            //   8bc3                 | mov                 eax, ebx
            //   2b45f8               | sub                 eax, dword ptr [ebp - 8]
            //   ebf2                 | jmp                 0xfffffff4

        $sequence_1 = { 84c0 7421 0fbed8 0fbec2 }
            // n = 4, score = 300
            //   84c0                 | test                al, al
            //   7421                 | je                  0x23
            //   0fbed8               | movsx               ebx, al
            //   0fbec2               | movsx               eax, dl

        $sequence_2 = { 8d8500ffffff 50 ff15???????? 50 68???????? 8d8500ffffff }
            // n = 6, score = 300
            //   8d8500ffffff         | lea                 eax, [ebp - 0x100]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   50                   | push                eax
            //   68????????           |                     
            //   8d8500ffffff         | lea                 eax, [ebp - 0x100]

        $sequence_3 = { 4a 75e5 837d0c00 7413 }
            // n = 4, score = 300
            //   4a                   | dec                 edx
            //   75e5                 | jne                 0xffffffe7
            //   837d0c00             | cmp                 dword ptr [ebp + 0xc], 0
            //   7413                 | je                  0x15

        $sequence_4 = { c3 55 8bec 81ec00010000 ff7508 }
            // n = 5, score = 300
            // 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81ec00010000         | sub                 esp, 0x100
            //   ff7508               | push                dword ptr [ebp + 8]

        $sequence_5 = { 3bc8 720c 8b4704 897708 c6040600 }
            // n = 5, score = 300
            //   3bc8                 | cmp                 ecx, eax
            //   720c                 | jb                  0xe
            //   8b4704               | mov                 eax, dword ptr [edi + 4]
            //   897708               | mov                 dword ptr [edi + 8], esi
            //   c6040600             | mov                 byte ptr [esi + eax], 0

        $sequence_6 = { 740d 83c0e0 7512 80ea61 80fa19 770a 41 }
            // n = 7, score = 300
            //   740d                 | je                  0xf
            //   83c0e0               | add                 eax, -0x20
            //   7512                 | jne                 0x14
            //   80ea61               | sub                 dl, 0x61
            //   80fa19               | cmp                 dl, 0x19
            //   770a                 | ja                  0xc
            //   41                   | inc                 ecx

        $sequence_7 = { 6a00 6a01 6800000080 8d85d4feffff 50 ffd6 8945fc }
            // n = 7, score = 300
            //   6a00                 | push                0
            //   6a01                 | push                1
            //   6800000080           | push                0x80000000
            //   8d85d4feffff         | lea                 eax, [ebp - 0x12c]
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   8945fc               | mov                 dword ptr [ebp - 4], eax

        $sequence_8 = { ebc1 3c67 7507 884705 b301 }
            // n = 5, score = 200
            //   ebc1                 | jmp                 0xffffffc3
            //   3c67                 | cmp                 al, 0x67
            //   7507                 | jne                 9
            //   884705               | mov                 byte ptr [edi + 5], al
            //   b301                 | mov                 bl, 1

        $sequence_9 = { 80ff01 7504 ac 884717 80ff02 }
            // n = 5, score = 200
            //   80ff01               | cmp                 bh, 1
            //   7504                 | jne                 6
            //   ac                   | lodsb               al, byte ptr [esi]
            //   884717               | mov                 byte ptr [edi + 0x17], al
            //   80ff02               | cmp                 bh, 2

        $sequence_10 = { f6c110 7427 f6c140 7412 08d2 }
            // n = 5, score = 200
            //   f6c110               | test                cl, 0x10
            //   7427                 | je                  0x29
            //   f6c140               | test                cl, 0x40
            //   7412                 | je                  0x14
            //   08d2                 | or                  dl, dl

        $sequence_11 = { eb45 ad 894721 eb3f 08d2 }
            // n = 5, score = 200
            //   eb45                 | jmp                 0x47
            //   ad                   | lodsd               eax, dword ptr [esi]
            //   894721               | mov                 dword ptr [edi + 0x21], eax
            //   eb3f                 | jmp                 0x41
            //   08d2                 | or                  dl, dl

        $sequence_12 = { c0e002 c0e805 88470a 3c01 ac }
            // n = 5, score = 200
            //   c0e002               | shl                 al, 2
            //   c0e805               | shr                 al, 5
            //   88470a               | mov                 byte ptr [edi + 0xa], al
            //   3c01                 | cmp                 al, 1
            //   ac                   | lodsb               al, byte ptr [esi]

        $sequence_13 = { c0e802 8a0401 00f0 8a0c01 f6c101 0f84b9000000 ac }
            // n = 7, score = 200
            //   c0e802               | shr                 al, 2
            //   8a0401               | mov                 al, byte ptr [ecx + eax]
            //   00f0                 | add                 al, dh
            //   8a0c01               | mov                 cl, byte ptr [ecx + eax]
            //   f6c101               | test                cl, 1
            //   0f84b9000000         | je                  0xbf
            //   ac                   | lodsb               al, byte ptr [esi]

        $sequence_14 = { 3ca3 7702 88da 88c6 80e603 }
            // n = 5, score = 200
            //   3ca3                 | cmp                 al, 0xa3
            //   7702                 | ja                  4
            //   88da                 | mov                 dl, bl
            //   88c6                 | mov                 dh, al
            //   80e603               | and                 dh, 3

    condition:
        7 of them and filesize < 122880
}